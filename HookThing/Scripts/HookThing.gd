extends KinematicBody2D


export (int) var velocidade = 10
export (int) var gravidade = 10
var target = Vector2()
var direction = Vector2()
var a = false
export (bool) var b = false
var motion = Vector2()

func _ready():
	$CameraPlayer/FinalMensagem.set_visible(false)
	pass 

func _input(event):
	if event.is_action_pressed('mousedireito'):
		velocidade = 10
		b=true
		a=true
		target = Vector2(get_global_mouse_position().x+5,get_global_mouse_position().y-40)
#	if event.is_action_pressed('mouseesquerdo') and a == true:
#		target = Vector2(position.x,position.y+400)
#		b=false
#		a=false
func _physics_process(delta):
    #position.y += gravidade
    direction += (target - position).normalized() * velocidade

    if (target - position).length() > 5:
        direction = move_and_slide(direction)
   






