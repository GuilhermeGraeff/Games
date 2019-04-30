extends Label
var polen =300
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():

	
	pass # Replace with function body.
func _process(delta):

	polen = str(get_owner().polen-1)
	text = polen
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
