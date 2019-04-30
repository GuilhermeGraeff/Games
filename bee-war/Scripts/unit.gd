extends KinematicBody2D
export var selected = true setget set_selected
onready var box = $box
onready var label = $label
onready var bar = $Progress
signal was_selected
signal was_deselected
export (int) var speed = 200
var target = Vector2()
var direction = Vector2()
export (NodePath) var unit

func set_selected(value):
	if selected!= value:
		selected=value
		box.visible= value
		label.visible= value
		bar.visible= value
		if selected:
			emit_signal("was_selected",self)
		else:
			emit_signal("was_deselected",self)

	
	
func _ready():
	set_process(true)
	connect("was_selected",get_parent(),"select_unit")
	connect("was_deselected",get_parent(),"deselect_unit")
	#box.visible= false
	set_selected(false)
	label.visible= false
	bar.visible= false 	
	label.text=name
	bar.value = randi()%90+10
	pass 
	



#IR ATÉ A POSIÇÃO DO MOUSE
func _input(event):
	if selected==true:
		if event.is_action_pressed('mousedireito'):
			target = get_global_mouse_position()



#IR EM DIREÇÃO AO PONTEIRO DO MOUSE
#func get_input():
#	if selected==true:
#    	look_at(get_global_mouse_position())
#    	velocity = Vector2()
#    	#if Input.is_action_pressed('ui_down'):
#        #	velocity = Vector2(-speed, 0).rotated(rotation)
#   	if Input.is_action_pressed('mousedireito'):
#        		velocity = Vector2(speed, 0).rotated(rotation)


#IR ATÉ ONDE FOI CLICADO COM O 'mousedireito'
func _physics_process(delta):
#   get_input()
	
	direction = (target - position).normalized() * speed
#   rotation = velocity.angle()
	if (target - position).length() > 5:
		move_and_slide(direction)
	

func _process(delta):
	update()

	pass


func _on_unit_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index== BUTTON_LEFT:  
				set_selected(not selected)
#			if event.button_index == BUTTON_RIGHT:
#				set_selected(false)
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	get_owner().polen+=1
	pass 
