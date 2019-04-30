extends KinematicBody2D	
var motion = Vector2()
var vel=100
var jump = 600
var Aceleracao = 50
var Max_Velocidade =200
var gravidade = 20
const UP = Vector2(0,-1)

func _physics_process(delta):
	motion.y += gravidade
	var friccao = false
	if Input.is_action_pressed("ui_right"):		
		motion.x = min(motion.x+Aceleracao , Max_Velocidade)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x-= Aceleracao
		motion.x = max(motion.x-Aceleracao,-Max_Velocidade)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	#elif Input.is_action_pressed("ui_up"):
	#	motion.y= -vel
	#elif Input.is_action_pressed("ui_down"):
	#	motion.y= vel
	else:
		
		$AnimatedSprite.play("Idle")
		friccao = true
		
	#	motion.y=0	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y= -jump
		if friccao == true:
			motion.x = lerp(motion.x,0,0.2)
	else:
		if motion.y<0:
			$AnimatedSprite.play("Jump")
		else:
			$AnimatedSprite.play("Fall")
		if friccao == true:
			motion.x = lerp(motion.x,0,0.2)
	motion = move_and_slide(motion,UP)
	
	
	pass