extends Entity
var goal_position : Vector2
@export var move_area : Area2D
var last_position : Vector2
var initial_position : Vector2
var move_direction
var offset : float
func _ready():
	position = initial_position
	goal_position = _generate_goal_vectorv2()
#	GameInputManager.connect("onUpArrowPressed", _generate_goal_vector)
func _process(delta):
#	print(velocity)
#	print(health_component.health)
#	print(goal_position)
	_move()
	move_and_slide()
func _move():
	move_direction = (goal_position - position).normalized()
	if position.distance_to(goal_position) > 3:
		velocity = move_direction * move_speed
	else:
		goal_position = _generate_goal_vectorv2()
		move_direction = (goal_position - position).normalized()
		if move_direction.x < 0:
			visual_component.sprite.flip_h = true
		else:
			visual_component.sprite.flip_h = false
	

func _generate_goal_vectorv2() -> Vector2:
	var c : CollisionPolygon2D
	var c2 : CollisionShape2D
	c = move_area.get_child(0)
	c2 = move_area.get_child(1)
	var random_vector = Vector2(randi_range(-c2.shape.get_rect().size.x, c2.shape.get_rect().size.x), randi_range(c2.shape.get_rect().size.y, -c2.shape.get_rect().size.y))
	while !Geometry2D.is_point_in_polygon(random_vector, c.polygon):
		random_vector = Vector2(randi_range(-c2.shape.get_rect().size.x, c2.shape.get_rect().size.x), randi_range(c2.shape.get_rect().size.y, -c2.shape.get_rect().size.y))
	return random_vector

func _on_timer_timeout():
	if abs(last_position.x - position.x) < 5 && abs(last_position.y - position.y) < 5:
		goal_position = _generate_goal_vectorv2()
	last_position = position
	if move_direction.x < 0:
		visual_component.sprite.flip_h = true
	else:
		visual_component.sprite.flip_h = false

func _on_health_component_on_death(entity):
	print("Dedge")
	queue_free()
