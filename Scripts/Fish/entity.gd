extends CharacterBody2D

class_name Entity

@export var move_speed : float

@export var hunger : float = 0
@export var energy : float = 100

@export var hitbox_component : HitBoxComponent
@export var health_component : HealthComponent
@export var visual_component : VisualComponent
@export var gravity = 100
func _move():
	pass

func _trigger_special():
	pass

func _eat():
	pass
