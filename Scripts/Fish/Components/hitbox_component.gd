extends Area2D
class_name HitBoxComponent
@export var collision_shape : CollisionShape2D
@export var health_component : HealthComponent

func damage(attack:Attack):
	if health_component:
		health_component._damage(attack)
