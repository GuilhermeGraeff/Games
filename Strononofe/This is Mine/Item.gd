extends Area

func _ready():
	pass
	
func _process(delta):
	rotate_x(deg2rad(60 * delta))
	rotate_y(deg2rad(60 * delta))

func _on_Item_body_entered(body):
	if body is KinematicBody:
		queue_free()
