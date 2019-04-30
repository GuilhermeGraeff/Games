extends KinematicBody2D

var motion = Vector2()
var gravity = 0.9
var stopped = 0
var speed = 100


func _physics_process(delta):
	motion.y += gravity

	if Input.is_action_pressed('ui_right'):
		motion.x = +speed
	elif Input.is_action_pressed('ui_left'):
		motion.x = -speed
	elif Input.is_action_pressed('ui_down'):
		motion.y = +speed
		motion.x = stopped
	elif Input.is_action_pressed('ui_up'):
		motion.y = -speed
		motion.x = stopped
	else: motion.y += gravity
	
	move_and_slide(motion)