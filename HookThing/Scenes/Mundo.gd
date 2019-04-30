extends Node2D
var target= Vector2()


func _ready():
	pass 
func _input(event):
   if event.is_action_pressed('mousedireito'):
        target = Vector2(get_global_mouse_position().x+5,get_global_mouse_position().y-40)
func _draw(): 
		if $HookThing.b == true:
			draw_line($HookThing.position, target, Color(255, 25, 25), 2)
func _process(delta):
	update()
	pass
