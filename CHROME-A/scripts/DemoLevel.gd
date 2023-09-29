extends Spatial

var renewableNearby = false
var clearableNearby = false

var renewCheck = false
var clearCheck = false

func _ready():
	$RenewedThing_Correct.hide()
	$RenewedThing_Wrong.hide()
	$RenewedEnviromentMap.hide()
	
	$DeadThing_Renew/TextPanel_Renew.hide()
	$DeadThing_Clear/TextPanel_Clear.hide()
	
func _physics_process(delta):
	var solved = false;
	# check if puzzle is solved
	if renewCheck and clearCheck:
		
		if not solved:
			$DeadEnviromentMap.hide()
			$RenewedEnviromentMap.show()
			solved = true;		
		
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene("res://Rooms/EndScreen.tscn")
		
	if renewableNearby:
		if $DeadThing_Renew.is_visible_in_tree():
			if Input.is_action_just_pressed("clear"):
				$DeadThing_Renew.hide()
			elif Input.is_action_just_pressed("renew"):
				$DeadThing_Renew.hide()
				$RenewedThing_Correct.show()
				renewCheck = true;
		else:
			if Input.is_action_just_pressed("clear") and not $RenewedThing_Correct.is_visible_in_tree():
				$DeadThing_Renew.show()
			elif Input.is_action_just_pressed("renew") and $RenewedThing_Correct.is_visible_in_tree():
				$DeadThing_Renew.show()
				$RenewedThing_Correct.hide()
				renewCheck = false
		#show to hide dialgue box
		if Input.is_action_just_pressed("interact") and $DeadThing_Renew.is_visible_in_tree():
			if not $DeadThing_Renew/TextPanel_Renew.is_visible_in_tree():
				$DeadThing_Renew/TextPanel_Renew.show()
			else:
				$DeadThing_Renew/TextPanel_Renew.hide()
	#second object
	elif clearableNearby:
		if $DeadThing_Clear.is_visible_in_tree():
			if Input.is_action_just_pressed("clear"):
				$DeadThing_Clear.hide()
				clearCheck = true
			elif Input.is_action_just_pressed("renew"):
				$DeadThing_Clear.hide()
				$RenewedThing_Wrong.show()
		else:
			if Input.is_action_just_pressed("clear") and not $RenewedThing_Wrong.is_visible_in_tree():
				$DeadThing_Clear.show()
				clearCheck = false
			elif Input.is_action_just_pressed("renew") and $RenewedThing_Wrong.is_visible_in_tree():
				$DeadThing_Clear.show()
				$RenewedThing_Wrong.hide()

		#show to hide dialgue box
		if Input.is_action_just_pressed("interact") and $DeadThing_Clear.is_visible_in_tree():
			if not $DeadThing_Clear/TextPanel_Clear.is_visible_in_tree():
				$DeadThing_Clear/TextPanel_Clear.show()
			else:
				$DeadThing_Clear/TextPanel_Clear.hide()
	



func _on_DeadThing_Renew_body_entered(body):
	renewableNearby = true
	
func _on_DeadThing_Renew_body_exited(body):
	renewableNearby = false

func _on_DeadThing_Clear_body_entered(body):
	clearableNearby = true
	
func _on_DeadThing_Clear_body_exited(body):
	clearableNearby = false
