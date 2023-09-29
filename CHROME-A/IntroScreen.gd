extends Control

func _process(delta):
	if Input.is_action_pressed("interact"):
		get_tree().change_scene("res://Rooms/DemoLevel.tscn")
