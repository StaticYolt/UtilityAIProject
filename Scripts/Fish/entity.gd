extends CharacterBody2D

class_name Entity
@export var eaten_calories : float
@export var move_speed : float
@export var power_level : int
@export var hunger : float = 0
@export var energy : float = 100
@export var fear : float
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
