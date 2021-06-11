extends Node
class_name Card

var texture
var cid
var cname
var ctype
var landscape
var cost
var atk
var def

func _ready():
	"Card class takes ID and sets other values from imported CSV"
	# name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
	get_node("Area2D/Sprite").set_texture(texture)
	get_node("Area2D/Sprite").scale = Vector2(0.55, 0.55)
	cname = _c.cardsall[cid]
	ctype = _c.cardsall[cid][2]
	landscape = _c.cardsall[cid][3]
	cost = _c.cardsall[cid][4]
	atk = _c.cardsall[cid][5]
	def = _c.cardsall[cid][6]

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		print("Clicked " + ctype)

func _on_Area2D_mouse_entered():
	#Enlarge self if mouse hovers
	print("Hover!")
	get_node("Area2D/Sprite").scale = Vector2(1, 1)

# To get values do card.ctype to show landscape etc
# print(card.ctype)
# OR
# print(card)

func _to_string():
	print("Name: ",cname)
	print("Card: ",ctype)
	print("Landscape: ",landscape)
	print("Cost: ",cost)
	if ctype != "Spell":
		print("Attack: ",atk)
		print("Defense: ",def)

