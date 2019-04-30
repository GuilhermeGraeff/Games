extends Node2D

var selected_units= []
onready var button = preload("res://Scenes/Button.tscn")
var buttons= []
var target = Vector2()
export(int) var polen=0




	
func select_unit(unit):
	if not selected_units.has(unit):
		selected_units.append(unit)
	#print("selected %s"%unit.name)
	create_buttons()
func deselect_unit(unit):
	
	if selected_units.has(unit):
		selected_units.erase(unit)
		
	#print("deselected %s"%unit.name)
	create_buttons()
func _input(event):
	
    	if event.is_action_pressed('mousedireito'):
      	  target = get_global_mouse_position()

func _draw(): 
	if $Abelha_1.selected==true:
		draw_line($Abelha_1.position, target, Color(255, 25, 25), 1)
	if $Abelha_2.selected==true:
		draw_line($Abelha_2.position, target, Color(255, 25, 25), 1)
	if $Abelha_3.selected==true:
		draw_line($Abelha_3.position, target, Color(255, 25, 25), 1)
	if $Abelha_4.selected==true:
		draw_line($Abelha_4.position, target, Color(255, 25, 25), 1)
	if $Abelha_5.selected==true:
		draw_line($Abelha_5.position, target, Color(255, 25, 25), 1)
	if $Abelha_6.selected==true:
		draw_line($Abelha_6.position, target, Color(255, 25, 25), 1)
	if $Abelha_7.selected==true:
		draw_line($Abelha_7.position, target, Color(255, 25, 25), 1)
	if $Abelha_8.selected==true:
		draw_line($Abelha_8.position, target, Color(255, 25, 25), 1)
	if $Abelha_9.selected==true:
		draw_line($Abelha_9.position, target, Color(255, 25, 25), 1)
	
	
func _process(delta):
	update()
func create_buttons():
	delete_buttons()
	for unit in selected_units:
		if not buttons.has(unit.name):
			var but = button.instance()
			but.connect_me(self, unit.name)
			but.rect_position = Vector2(buttons.size() * 64 + 32 , -120)
			$'UI/Base'.add_child(but)
			buttons.append(unit.name)

func delete_buttons():
	for but in buttons:
		if $'UI/Base'.has_node(but):
			var b = $'UI/Base'.get_node(but)
			b.queue_free()
			$'UI/Base'.remove_child(b)
	buttons.clear()

func was_pressed(obj):
	for unit in selected_units:
		if unit.name == obj.name:
			unit.set_selected(false)
			break
	
	

func _ready():
	pass 
