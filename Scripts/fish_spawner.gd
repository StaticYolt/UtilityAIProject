extends Node2D
var npc_fish_1 = preload("res://Scenes/Fish/npc_fish_1.tscn")
@export var npc_move_area : Area2D

func _ready():
	GameInputManager.connect("onUpArrowPressed", _spawn_fish)
func _spawn_fish():
	print("isworikng")
	var curr_fish = npc_fish_1.instantiate()
	curr_fish.move_area = npc_move_area
	curr_fish.move_speed = 50
	curr_fish.initial_position = _generate_goal_vector()
	get_parent().add_child(curr_fish)
	
func _generate_goal_vector() -> Vector2:
	var c : CollisionPolygon2D
	var c2 : CollisionShape2D
	c = npc_move_area.get_child(0)
	c2 = npc_move_area.get_child(1)
	var random_vector = Vector2(randi_range(-c2.shape.get_rect().size.x, c2.shape.get_rect().size.x), randi_range(-c2.shape.get_rect().size.y, c2.shape.get_rect().size.y))
	while !Geometry2D.is_point_in_polygon(random_vector, c.polygon):
		random_vector = Vector2(randi_range(-c2.shape.get_rect().size.x, c2.shape.get_rect().size.x), randi_range(-c2.shape.get_rect().size.y, c2.shape.get_rect().size.y))
	return random_vector
