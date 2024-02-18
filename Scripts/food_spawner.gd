extends Timer
var food = preload("res://Scenes/Fish/krill.tscn")
@export var npc_move_area : Area2D

func _on_timeout():
	_spawn_food()
#	wait_time = wait_time_max
func _spawn_food():
	var curr_food = food.instantiate()
	curr_food.position = _generate_goal_vector()
	curr_food.move_speed = 2
	get_parent().add_child(curr_food)
	
func _generate_goal_vector() -> Vector2:
	var c : CollisionPolygon2D
	var c2 : CollisionShape2D
	c = npc_move_area.get_child(0)
	c2 = npc_move_area.get_child(1)
	var random_vector = Vector2(randi_range(-c2.shape.get_rect().size.x, c2.shape.get_rect().size.x), randi_range(-c2.shape.get_rect().size.y, c2.shape.get_rect().size.y))
	while !Geometry2D.is_point_in_polygon(random_vector, c.polygon):
		random_vector = Vector2(randi_range(-c2.shape.get_rect().size.x, c2.shape.get_rect().size.x), randi_range(-c2.shape.get_rect().size.y, c2.shape.get_rect().size.y))
	return random_vector
