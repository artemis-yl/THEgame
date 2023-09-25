extends RigidBody


const MOVE_SPEED = 5
var y_velo = 0
var facing_right = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physic_process(delta):
	var input = Input.get_action_strength("ui_up")
	apply_central_impulse(input * Vector3.FORWARD * 1000.0 * delta)
	
	
