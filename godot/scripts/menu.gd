extends Node2D

# Exit game when press ESC for ease of debugging
func _process(delta):
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()

func _on_Button_pressed(): # startgame button
	get_tree().change_scene("res://scenes/game.tscn") # when pressed, switch to the game 
