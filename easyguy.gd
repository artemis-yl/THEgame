extends KinematicBody
 
const MOVE_SPEED = 15
const JUMP_FORCE = 10
const GRAVITY = 9.8
const MAX_FALL_SPEED = 100
var y_velo = 0
var facing_right = false
var move_dir = 0
 
onready var anim_player = $Graphics/AnimationPlayer
 
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		move_dir += 1
		$easyguy.play("walk")
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
		$easyguy.play("walk")
 
	var just_jumped = false
	var grounded = is_on_floor()
	y_velo -= GRAVITY * delta
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	if grounded:
		y_velo = -0.1
		if Input.is_action_pressed("jump") and grounded:
			y_velo -= JUMP_FORCE
			just_jumped = true
		if grounded and Input.is_action_pressed("shift"):
			$easyguy.play("running")
	move_and_slide(Vector3(move_dir * MOVE_SPEED, y_velo, 0), Vector3(0,1,0))
