extends KinematicBody2D	
var motion= Vector2()
var vel=100
var jump = 600
var gravidade = 20
const UP = Vector2(0,-1)

func _physics_process(delta):
	motion.y += gravidade
	if Input.is_action_pressed("ui_right"):
		motion.x= vel
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x= -vel
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	#elif Input.is_action_pressed("ui_up"):
	#	motion.y= -vel
	#elif Input.is_action_pressed("ui_down"):
	#	motion.y= vel
	else:
		motion.x=0
		$AnimatedSprite.play("Idle")
	#	motion.y=0	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y= -jump
			$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Jump")
	motion = move_and_slide(motion,UP)
	pass