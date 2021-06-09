extends Node
class_name Card

var cardloc = Vector2(-1300,100)
var cid
var ctype
var landscape
var cost
var atk
var def

func _ready():
	#in_id=0,in_x=255,in_y=100
	"Card class takes ID and sets other values from imported CSV"
	# name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
	$Sprite.set_texture(cid)
	$Sprite.scale = Vector2(0.55, 0.55)
	ctype = _c.cardsall[cid][2]
	landscape = _c.cardsall[cid][3]
	cost = _c.cardsall[cid][4]
	atk = _c.cardsall[cid][5]
	def = _c.cardsall[cid][6]
	self.to_string()

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Clicked " + ctype)

func _on_Card_mouse_entered():
	#Enlarge self if mouse hovers
	print("Hover!")
	$Sprite.scale = Vector2(2, 2)

func _init():
	pass#return self

# To get values do card.ctype to show landscape etc
# print(card.ctype)
# OR
# print(card)

func to_string():
	print("Card: ",self.ctype)
	print("Landscape: ",self.landscape)
	print("Cost: ",self.cost)
	print("Attack: ",self.atk)
	print("Defense: ",self.def)
