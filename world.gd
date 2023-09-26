extends Spatial


var exists = true




# Called when the node enters the scene tree for the first time.
func _ready():
	$willAppear.hide()
	$testGridMap.hide()


func _on_CheckButton_pressed():
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
