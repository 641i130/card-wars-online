extends Area2D
extends "res://scripts/decklists.gd"

# When loaded, set this variable to the  sprite in the player's hand
onready var one = get_tree().get_root().get_node("Desk/Player Hand/One/One")
onready var two = get_tree().get_root().get_node("Desk/Player Hand/Two/Two")
onready var three = get_tree().get_root().get_node("Desk/Player Hand/Three/Three")
onready var four = get_tree().get_root().get_node("Desk/Player Hand/Four/Four")
onready var five = get_tree().get_root().get_node("Desk/Player Hand/Five/Five")
onready var hand = [[0, one],[1, two], [2, three],[3, four],[4, five]]
onready var cardsall = {}

func _ready():
	readincsv() # Read CSV file into memory
"""
CSV ORDER:
name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
"""
func readincsv():
	var file = File.new()
	file.open("res://assets/cards.csv", file.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line()) # 
		cardsall[cardsall.size()] = data_set # Append to file
	file.close()
	print(cardsall[1][0]) # Example on how to read card name with an ID 1 being the ID of the card and 0 being the card's name record


var rng = RandomNumberGenerator.new()
onready var counter = 0;

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Click")
		random_card()

func genCard():
	var card = load("res://scripts/Card.gd")
	var first = card.new()
	first.landscape = "Corn"
	



func random_card():
	# Allow the player to draw a card in their deck
	if counter <= 4:
		rng.randomize()
		var rand_card = load("res://assets/cards/" +str(rng.randi_range(1, 512))+ ".jpg" )
		hand[counter][1].set_texture(rand_card)
		counter+=1
