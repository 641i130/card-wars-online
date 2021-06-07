extends Node
class_name Card
# Card template with attached sprite and collisionshape2d !!! YAY

func _ready():
	self.connect("mouse_entered",self,"onMouseOverlap")


func onMouseOverlap():
	print("YEET!!!")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Clicked " + ctype)

# Initialize the variables used in the functions
var ctype
var landscape
var atk
var def

# INIT
#func _init(a="Null",b="Null",c=0,d=0):
	# If the values aren't set in the call, then assume they are Null or 0
	#ctype = a
	#landscape = b
	#atk = c
	#def = d
func _init(in_id=0):
	"Card class takes ID and sets other values from imported CSV"
	id = in_id

# To get values do card.ctype to show landscape etc

func _to_string():
	print("Card: ",self.ctype)
	print("Landscape: ",self.landscape)
	print("Attack: ",self.atk)
	print("Defense: ",self.def)

