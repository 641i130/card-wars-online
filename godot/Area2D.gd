extends Area2D

onready var card = get_tree().get_root().get_node("Desk/Deck/Card")
var rng = RandomNumberGenerator.new()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("Click")
		random_card()
		
func random_card():
	rng.randomize()
	var rand_card = load("res://assets/cards/" +str(rng.randi_range(1, 512))+ ".jpg" )
	card.set_texture(rand_card)
