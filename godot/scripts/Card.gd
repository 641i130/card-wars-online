extends Node
class_name Card
# Card template

export var type := "Blank"
export var landscape := "Blank"
export var atk := "0"
export var def := "0"

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		# If mouse click left button then give player a card      
		print("Clicked " + type)
