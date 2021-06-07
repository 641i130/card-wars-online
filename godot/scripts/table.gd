extends Area2D
#extends "res://scripts/decklists.gd"

# When loaded, set this variable to the  sprite in the player's hand
onready var one = get_tree().get_root().get_node("Desk/Player Hand/One/One")
onready var two = get_tree().get_root().get_node("Desk/Player Hand/Two/Two")
onready var three = get_tree().get_root().get_node("Desk/Player Hand/Three/Three")
onready var four = get_tree().get_root().get_node("Desk/Player Hand/Four/Four")
onready var five = get_tree().get_root().get_node("Desk/Player Hand/Five/Five")
onready var hand = [[0, one],[1, two], [2, three],[3, four],[4, five]]
onready var cardsall = {}
onready var playersdeck = []
onready var handar = []
onready var discard = []
var rng = RandomNumberGenerator.new()
onready var counter = 0

func _ready():
	readincsv() # Read CSV file into memory; will change this into a better system later
	genDeck()
	var test = Card.new("test")
	print(test)
"""
CSV ORDER:
name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
"""
func readincsv():
	var file = File.new()
	file.open("res://assets/cards.csv", file.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line()) # Read each line and add it to the {}
		cardsall[cardsall.size()] = data_set # Append to file
	file.close()
	print(cardsall[1][0]) # Example on how to read card name with an ID 1 being the ID of the card and 0 being the card's name record

func _on_Area2D_input_event(viewport, event, shape_idx):
	"When clicked on deck, draw a card from the deck into hand"
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card
		if len(handar) < 5: # Can only have this many cards in hand
			# Draw a random card
			random_card()

func genCard():
	var card = load("res://scripts/Card.gd")
	var first = card.new(12)

func genDeck():
	# Generate player's deck
	var c = 0
	for card in Decklists.CP1a: # Choose deck here
		print(card)
		for i in range(1,int(card[1])+1):
			playersdeck.append(card[0])
			c+=1
			i+=1
	if (c == 39):
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
		var num = rng.randi_range(0, playersdeck.size()-1)
		# Remove card from deck
		# Add card to hand
		var rand_card = load("res://assets/cards/" +str(playersdeck[num])+ ".jpg" )
		var game = load("res://game.tscn")
		add_child_below_node(get_tree().get_root().get_node("game"),rand_card.instance())
		hand[counter][1].set_texture(rand_card)
		counter+=1
		toHand(num)
	if counter >= 5:
		counter = 0
