extends Node2D

func _ready():
	set_process(true)


# Exit game when press ESC for ease of debugging
func _process(_delta):
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()


