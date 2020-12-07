extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Exit game when press ESC for ease of debugging
func _process(delta):
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()
