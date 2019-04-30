extends Area

var items = 0

func _ready():
	pass
	
func _process(delta):
	
#	rotate_x(deg2rad(60 * delta))
	rotate_y(deg2rad(60 * delta))

	



func _on_ITEM_body_entered(body):
	items += 1 
	queue_free()
