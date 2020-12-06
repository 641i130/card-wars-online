extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# Exit game when press ESC for ease of debugging
func _process(delta):
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()

func _on_Button_pressed(): # startgame button
	get_tree().change_scene("res://scenes/game.tscn") # when pressed, switch to the game 
