extends Entity
class_name BaseNPCFish
var goal_position : Vector2
@export var move_area : Area2D
@export var sensory_component : Area2D
@export var modulate_color : Color
@export var collider2D : CollisionShape2D
var last_position : Vector2
var initial_position : Vector2
var move_direction : Vector2
var offset : float
var max_move_speed : float
enum fish_states {WANDER = 1, CHASE = 2}

var curr_state = fish_states.WANDER

func _ready():
	max_move_speed = move_speed
	position = initial_position
	goal_position = _generate_goal_vectorv2()
	_to_idle()
#	GameInputManager.connect("onUpArrowPressed", _generate_goal_vector)
func _process(delta):
#	print(hitbox_component.collision_shape.disabled)
	hunger = abs(100 - health_component.health)
#	print(find_child("UtilityAiAgent")._action_scores)
#	print(velocity)
#	print(health_component.health)
#	print(goal_position)
	match curr_state:
		fish_states.WANDER:
			_wander()
		fish_states.CHASE:
			_chase()
	move_and_slide()
func _wander():
	move_direction = (goal_position - position).normalized()
	if position.distance_to(goal_position) > 3:
		velocity = move_direction * move_speed
	else:
		goal_position = _generate_goal_vectorv2()
		move_direction = (goal_position - position).normalized()
		_update_sprite_dir(move_direction.x < 0)

var target : Entity
func _chase():
	if is_instance_valid(target):
		move_direction = (target.position - position).normalized()
		if position.distance_to(target.position) > 3:
			velocity = move_direction * move_speed
			print("chasing")
		_update_sprite_dir(move_direction.x < 0)
	else:
		_find_target()
		move_direction = (goal_position- position).normalized()
		if position.distance_to(goal_position) > 3:
			velocity = move_direction * move_speed
			_update_sprite_dir(move_direction.x < 0)
		else:
			goal_position = _generate_goal_vectorv2()
			move_direction = (goal_position - position).normalized()
			_update_sprite_dir(move_direction.x < 0)

func _find_target():
	var targets = sensory_component.get_overlapping_areas()
	if targets:
		var valid_targets_distances : Array
		var valid_targets : Array
		for element in targets:
			if element.get_parent() is Krill:
				valid_targets_distances.append(int(position.distance_to(element.get_parent().position)))
				valid_targets.append(element.get_parent())
		if valid_targets and valid_targets_distances:
			target = valid_targets[valid_targets_distances.find(valid_targets_distances.min())]
		
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
	_update_sprite_dir(move_direction.x < 0)

func _on_health_component_on_death(entity):
	visual_component.animation_tree.get("parameters/playback").travel("death")

func _update_sprite_dir(condition):
	visual_component.sprite.flip_h = condition

func _to_idle():
	curr_state = fish_states.WANDER
	collider2D.disabled = true
	hitbox_component.collision_shape.disabled = true
	move_speed = max_move_speed
func _to_chase():
	curr_state = fish_states.CHASE
	move_speed = max_move_speed + 20
	hitbox_component.collision_shape.disabled = false
	collider2D.disabled = false
func _on_utility_ai_agent_top_score_action_changed(top_action_id):
#	print("Action changed: %s" % top_action_id)

	match top_action_id:
		"idle":
			_to_idle()
		"eat":
			_to_chase()
