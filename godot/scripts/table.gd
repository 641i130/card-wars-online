extends Area2D
#extends "res://scripts/decklists.gd"
# When loaded, set this variable to the  sprite in the player's hand
onready var hand = [[0, null],[1, null], [2, null],[3, null],[4, null]] # Max 5 cards in hand ... I need to expand this later
onready var playersdeck = []
onready var handar = []
var discard = []
var rng = RandomNumberGenerator.new()
var counter = 0
var cardloc = Vector2(-1300,100)

func _ready():
	genDeck()

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	"When clicked on deck, draw a card from the deck into hand"
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card
		if len(handar) < 5: # Can only have this many cards in hand
			# Draw a random card
			random_card()
###########################################################################

func genCard(cid):
	"Inits card from class and returns it"
	cardloc.x+=200
	#Add little spaces between your cards
	if counter >= 1:
		cardloc.x += 10
	var cc = preload("res://Card.tscn").instance()#id,cardx,100
	cc.position = cardloc
	cc.cid = cid
	cc.texture = load("res://assets/cards/" +str(playersdeck[cid])+ ".jpg")
	
	return cc

func genDeck():
	# Generate player's deck
	var c = 0
	for card in _c.CP1a: # Choose deck here
		#print(card)
		for _i in range(1,int(card[1])+1):
			playersdeck.append(card[0])
			c+=1
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
		var newcard = genCard(cid)
		add_child_below_node(get_tree().get_root().get_node("Desk"),newcard)
		counter+=1
		toHand(cid)
		
	if counter >= 5:
		counter = 0
		
