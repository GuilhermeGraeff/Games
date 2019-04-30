extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

const GRAVITY = 20
#const STOPPED  = 0
const SPEED = 200
const MAX_SPEED = 400
const ACCELERATION = 40
const JUMP_HEIGHT = -500

func _physics_process(delta):
	var friction = false
	
	# Apply Gravity
	motion.y += GRAVITY
	
	# Player Movement
	if Input.is_action_pressed('ui_right'): 
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play('run')
		
	elif Input.is_action_pressed('ui_left'): 
		motion.x = max(motion.x -ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play('run')
		
	else: 
		$Sprite.play('idle')
		friction = true

	# Floor detection
	if is_on_floor():
		if Input.is_action_just_pressed('ui_select'):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play('jump')
		else:
			$Sprite.play('fall')
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)

	motion = move_and_slide(motion, UP)