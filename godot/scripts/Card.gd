extends Node
class_name Card
# Card template with attached sprite and collisionshape2d !!! YAY
var ctype
var landscape
var atk
var def
var id
var cost

func _ready():
	pass

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Clicked " + ctype)

func _on_Card_mouse_entered():
	#Enlarge self if mouse hovers
	print("Hover!")
	self.get_node("Card/Card").scale = Vector2(2, 2)

func _init(in_id=0,in_x=255,in_y=100):
	"Card class takes ID and sets other values from imported CSV"
	# name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
	var cardloc = Vector2(-1300, in_y)
	cardloc.x += in_x
	self.global_position = cardloc
	
	
	id = in_id
	ctype = _c.cardsall[id][2]
	landscape = _c.cardsall[id][3]
	cost = _c.cardsall[id][4]
	atk = _c.cardsall[id][5]
	def = _c.cardsall[id][6]

# To get values do card.ctype to show landscape etc
# print(card.ctype)
# OR
# print(card)

func _to_string():
	print("Card: ",self.ctype)
	print("Landscape: ",self.landscape)
	print("Cost: ",self.cost)
	print("Attack: ",self.atk)
	print("Defense: ",self.def)

