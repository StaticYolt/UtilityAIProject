extends Entity
class_name Krill
@export var radius = 10
var angle = 0
var initial_position : Vector2
func _ready():
	initial_position = position
func _process(delta):
	_move()
func _move():
	angle += move_speed * get_physics_process_delta_time()
	
	var x = radius * cos(angle)
	var y = radius * sin(angle)
	
	position.x = x  + initial_position.x 
	position.y = y + initial_position.y


func _on_hitbox_component_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area is HitBoxComponent and not(area.get_parent() is Krill) and not(area is SensoryComponent) and not(area.get_parent().hitbox_component.collision_shape.disabled):
		area.get_parent().health_component.health = clampi(area.get_parent().health_component.health + calories, 0, 100)
		queue_free()
