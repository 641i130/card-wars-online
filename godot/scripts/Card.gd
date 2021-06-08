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
	self.connect("mouse_entered",self,"onMouseOverlap")

func onMouseOverlap():
	"Placeholder for hover zoom in like Pokemon?"
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Clicked " + ctype)
	
	if event.type is InputEvent.MOUSE_B:
		"Enlarge self if mouse hovers"
		print("Hover!")
		

func _init(in_id=0,in_x=255,in_y=255):
	"Card class takes ID and sets other values from imported CSV"
	# name,description,card_type,landscape,cost,atk,def,ability,deck_info,image_name
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

