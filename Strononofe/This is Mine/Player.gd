extends KinematicBody

const STOPPED = 0
var movement = Vector3()
var speed = 200



func _ready():
	pass
	
func _physics_process(delta):
	movement.z = STOPPED
	movement.y = STOPPED
	movement.x = STOPPED
	
	if Input.is_action_just_pressed('up'):
		movement.x = +speed
		
	elif Input.is_action_just_pressed('down'):
		movement.x = -speed
		
	elif Input.is_action_just_pressed('right'):
		movement.z = +speed
	
	elif Input.is_action_just_pressed('left'):
		movement.z = -speed
		
	movement = move_and_slide_with_snap(movement, Vector3(0, speed, 0)) 
	