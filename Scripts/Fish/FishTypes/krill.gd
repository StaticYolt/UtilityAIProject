extends Entity

@export var radius = 30
var angle = 0
func _process(delta):
	_move()
func _move():
	angle += move_speed * get_physics_process_delta_time()
	
	var x = radius * cos(angle)
	var y = radius * sin(angle)
	
	position.x = x
	position.y = y
