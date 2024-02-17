extends Entity
var goal_position : Vector2
var offset : float
func _move():
	if position.x < goal_position.x + offset:
		position.x += move_speed
	if position.x > goal_position.x + offset:
		position.x -= move_speed
	
	
		
