extends KinematicBody

const STOPPED = 0
var movement = Vector3()
var speed = 100
var steps = 0

signal step_change


func setScore(valor):
	steps = valor
	emit_signal("step_change")


func _ready():
	pass
	
func _physics_process(delta):
	movement.z = STOPPED
	movement.y = STOPPED
	movement.x = STOPPED
	
	if Input.is_action_just_pressed('up'):
		movement.x = -speed
		steps += 1
		
	elif Input.is_action_just_pressed('back'):
		movement.x = +speed
		steps += 1
		
	elif Input.is_action_just_pressed('right'):
		movement.z = -speed
		steps += 1
		
	elif Input.is_action_just_pressed('left'):
		movement.z = +speed
		steps += 1
		
	movement = move_and_slide_with_snap(movement, Vector3(0, speed, 0)) 
	
	
	
	print(steps)