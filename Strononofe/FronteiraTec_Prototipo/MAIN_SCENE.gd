extends Spatial


export(int) var steps=0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass 
func _process(delta):
	steps= $PLAYER.steps
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
