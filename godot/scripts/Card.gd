extends Sprite
class_name Card
# Card template

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Clicked " + ctype)

var ctype
var landscape
var atk
var def


func _init(a="Null",b="Null",c=0,d=0):
	ctype = a
	landscape = b
	atk = c
	def = d

func get_atk():
	return atk
	
func get_ctype():
	return ctype
	
func _to_string():
	print("Card: ",ctype)
	print("Landscape: ",landscape)
	print("Attack: ",atk)
	print("Defense: ",def)

