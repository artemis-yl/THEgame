extends Button


func _ready():
	pass


func _on_PlayButton_pressed():
	# get_tree accesses all the scenes in the project
	get_tree().change_scene("res://world.tscn")
