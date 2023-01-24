extends KinematicBody2D

const UP = Vector2(0.0, -1.0)
export var Maxspeed = 80
export var MaxFallsSpeed = 200
export var Gravity = 30
export var jumpForce = 300
export var accel = 10

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += Gravity
	if motion.y > MaxFallsSpeed:
		motion.y = MaxFallsSpeed
	
	motion.x = clamp(motion.x, -Maxspeed, Maxspeed)
	
	if Input.is_action_pressed("Right"):
		motion.x += accel

	elif Input.is_action_pressed("Left"):
		motion.x -= accel

	else:
		motion.x = lerp(motion.x, 0, 0.2)


	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			motion.y = -jumpForce
	
	motion = move_and_slide(motion, UP)
