# Structured Data
extends Node
# FINN AND JAKE DECK
# [Card ID, Quantity]
onready var CP1a = [[14,"1"],[26,"2"],[34,"2"],[66,"1"],[86,"1"],[87,"1"],[88,"2"],[89,"2"],[90,"2"],[100,"1"],[120,"1"],[132,"1"],[148,"2"],[149,"1"],[150,"2"],[228,"2"],[230,"2"],[265,"2"],[320,"2"],[325,"1"],[356,"2"],[400,"1"],[454,"2"],[473,"2"],[488,"2"]]
onready var CP1b = [[8,"2"],[34,"2"],[66,"1"],[68,"2"],[82,"2"],[116,"2"],[126,"2"],[192,"2"],[217,"1"],[303,"2"],[342,"2"],[346,"2"],[386,"1"],[439,"2"],[454,"2"],[462,"2"],[481,"1"],[498,"1"],[499,"2"],[500,"2"],[501,"1"],[503,"2"],[507,"2"]]
onready var cardsall = {}

"""
CSV ORDER:
name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
"""
func _ready():
	readincsv() # Read CSV file into memory; will change this into a better system later

func readincsv():
	var file = File.new()
	file.open("res://assets/cards.csv", file.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line()) # Read each line and add it to the {}
		cardsall[cardsall.size()] = data_set # Append to file
	file.close()
	#print(cardsall[1][0]) # Example on how to read card name with an ID 1 being the ID of the card and 0 being the card's name record
