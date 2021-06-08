extends Area2D
#extends "res://scripts/decklists.gd"

# When loaded, set this variable to the  sprite in the player's hand
onready var hand = [[0, null],[1, null], [2, null],[3, null],[4, null]]

onready var playersdeck = []
onready var handar = []
onready var discard = []
var rng = RandomNumberGenerator.new()
onready var counter = 0

func _ready():
	genDeck()

"Draw from deck again"
func _on_Area2D_input_event(viewport, event, shape_idx):
	"When clicked on deck, draw a card from the deck into hand"
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card
		if len(handar) < 5: # Can only have this many cards in hand
			# Draw a random card
			random_card()
####################################################################

func genCard(id):
	"Inits card from class and returns it"
	return load("res://Card.tscn").instance(id) # init method

func genDeck():
	# Generate player's deck
	var c = 0
	for card in _c.CP1a: # Choose deck here
		#print(card)
		for i in range(1,int(card[1])+1):
			playersdeck.append(card[0])
			c+=1
			i+=1
	if (c < 40):
		print("This deck is broken!")

func toHand(num):
	# Take card out of player's deck and put it into the player's hand array
	playersdeck.remove(playersdeck.find(playersdeck[num]))
	handar.append(num)
	print(playersdeck)
	
func toDiscard(num):
	# Take card out of player's hand and put it into the discard array
	handar.remove(handar.find(playersdeck[num]))
	discard.append(num)
	print(handar)
	
func toLane():
	pass
	
func random_card():
	# Allow the player to draw a card in their deck
	if counter <= 4:
		rng.randomize()
		# Choose card in their deck array
		var cid = rng.randi_range(0, playersdeck.size()-1)
		# Remove card from deck
		# Add card to hand
		var rand_card = load("res://assets/cards/" +str(playersdeck[cid])+ ".jpg" )
		var game = load("res://game.tscn")
		var newcard = genCard(cid)
		newcard.global_position = Vector2(-900, 70)
		newcard.get_node("Card/Card").set_texture(rand_card)
		newcard.get_node("Card/Card").scale = Vector2(0.55, 0.55)
		add_child_below_node(get_tree().get_root().get_node("Desk"),newcard)
		counter+=1
		toHand(cid)
		
	if counter >= 5:
		counter = 0
