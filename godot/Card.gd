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
var hovered = 0

func _ready():
	"Card class takes ID and sets other values from imported CSV"
	# name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
	get_node("Area2D/Sprite").set_texture(texture)
	get_node("Area2D/Sprite").scale = Vector2(0.55, 0.55)
	cname = _c.cardsall[cid][0]
	ctype = _c.cardsall[cid][2]
	landscape = _c.cardsall[cid][3]
	cost = _c.cardsall[cid][4]
	atk = _c.cardsall[cid][5]
	def = _c.cardsall[cid][6]
	print(str(self))

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		print("Clicked " + ctype)

func _on_Area2D_mouse_entered():
	# Enlarge self if mouse hovers
	print("Entered card!")
	get_node("Area2D/Sprite").scale = Vector2(1, 1)

func _on_Area2D_mouse_exited():
	# De-scale self
	print("Left card!")
	get_node("Area2D/Sprite").scale = Vector2(0.55, 0.55)

func _to_string():
	print("Name: ",self.cname)
	print("Card: ",self.ctype)
	print("Landscape: ",self.landscape)
	print("Cost: ",self.cost)
	if ctype != "Spell":
		print("Attack: ",self.atk)
		print("Defense: ",self.def)

