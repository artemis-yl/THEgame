extends Spatial


var exists = true
var interactable_nearby = false




# Called when the node enters the scene tree for the first time.
func _ready():
	$willAppear.hide()
	#$testGridMap.hide()
	$testGridMap.queue_free()

func _physics_process(delta):
	if Input.is_action_pressed("interact") and interactable_nearby:
		print("will poof")
		$WillDisappear.hide()
		$willAppear.show()


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
		


func _on_WillDisappear_body_entered(body):
	interactable_nearby = true
	print("i entered")


func _on_WillDisappear_body_exited(body):
	interactable_nearby = false
	print("i left")
