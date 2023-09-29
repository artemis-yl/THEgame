extends KinematicBody


const MOVE_SPEED = 20
const JUMP_SPEED = 15
const GRAVITY = 30
const MAX_FALL_SPEED = 100
var y_velocity = 0
var facing_right = false

onready var anim_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta): #put everything that happens in here
	# move the player right, left, or stay still
	var move_dir = 0 #'reset's so can only be 0, 1(right) or -1(left)
	#if player pressed both buttons, will end up being +1 -1 = 0
	if Input.is_action_pressed("moveRight"):
		move_dir += 1
	if Input.is_action_pressed("moveLeft"):
		move_dir -= 1
		
	move_and_slide(Vector3(move_dir * MOVE_SPEED, y_velocity, 0), Vector3(0,1,0))
	#for index in get_slide_count():
	#	var collision = get_slide_collision(index)
	#	var body = collision.collider
	#	print("collided w/: ", body.name)

	#jump code. demo says need to be after move_and_slide
	var just_jumped = false
	var grounded = is_on_floor()
	# -= so it doesnt float. physics prevents it from falling through floor
	y_velocity -= GRAVITY * delta
	
	# cap fall speed
	if y_velocity < -MAX_FALL_SPEED:
		y_velocity = -MAX_FALL_SPEED
		
	if grounded:
		y_velocity = 0
		if Input.is_action_pressed("jump"):
			y_velocity = JUMP_SPEED
			just_jumped = true

	#if move_dir < 0 and facing_right:
	#	flip()
	#if move_dir > 0 and !facing_right:
	#	flip()

	#if just_jumped:
		#play_anim("jump")
	if grounded:
		if move_dir == 0:
			play_anim("idle")
		else:
			play_anim("walk")

#func flip():
#	$Graphics.rotation_degrees.y *= -1
#	facing_right = !facing_right

func play_anim(anim):
	if anim_player.current_animation == anim:
		return
	anim_player.play(anim)
