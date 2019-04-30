extends MeshInstance

var movement = Vector3()

func _ready():
	pass


func _process(delta):
	rotate_x(5 * delta)
	rotate_y(5 * delta)