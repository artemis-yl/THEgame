extends Spatial

var exists = true
var interactable_nearby = false
var move_interact_nearby = false

var will_ppearCheck = false
var movingObjCheck = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$willAppear.hide()
	$willAppear2.hide()
	#$testGridMap.hide()
	$testGridMap.queue_free()
	$WillDisappear/GUITextPanel.hide()

func _physics_process(delta):
	
	if movingObjCheck and will_ppearCheck:
		get_tree().change_scene("res://MenuScreen.tscn")
	
	if interactable_nearby:
		#let's say the willDissapear ones need to be renewed, not cleansed
		if $WillDisappear.is_visible_in_tree():
			if Input.is_action_just_pressed("cleanse"):
				print("will poof")
				$WillDisappear.hide()
			elif Input.is_action_just_pressed("renew"):
				$WillDisappear.hide()
				$willAppear.show()
				will_ppearCheck = true
		else:
			if Input.is_action_just_pressed("cleanse") and not $willAppear.is_visible_in_tree():
				$WillDisappear.show()
				print("i am back")
			elif Input.is_action_just_pressed("renew") and $willAppear.is_visible_in_tree():
				$WillDisappear.show()
				$willAppear.hide()
				will_ppearCheck = false
		
	#just_pressed ensures that the same key can be used to do both actions seperately
		# aka no race conditions
		if Input.is_action_just_pressed("interact") and $WillDisappear.is_visible_in_tree():
			if not $WillDisappear/GUITextPanel.is_visible_in_tree():
				$WillDisappear/GUITextPanel.show()
				print("i dialgued")
			else:
				$WillDisappear/GUITextPanel.hide()
				print("dialogue hide again")
			
	elif move_interact_nearby:
		if Input.is_action_just_pressed("cleanse"):
			$InteractOne.hide()
			movingObjCheck = true
		elif Input.is_action_just_pressed("renew"):
			$InteractOne.hide()
			$willAppear2.show()
			
			
	

			

			


"""func _on_CheckButton_pressed():
	if $WillDisappear.is_visible_in_tree():
		$WillDisappear.hide()
		$willAppear.show()
		
		$GridMap.hide()
		$testGridMap.show()
	else:
		$WillDisappear.show()
		$willAppear.hide()
		
		$GridMap.show()
		$testGridMap.hide()
		"""
		

#obv having a flag for each guy is not efficient, but as if i have time rn
func _on_WillDisappear_body_entered(body):
	interactable_nearby = true
	print("i entered")

func _on_WillDisappear_body_exited(body):
	interactable_nearby = false
	print("i left")


func _on_InteractOne_body_entered(body):
	move_interact_nearby = true
	print("moving found")

func _on_InteractOne_body_exited(body):
	move_interact_nearby = false
	print("moving left")
