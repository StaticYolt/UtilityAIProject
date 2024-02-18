extends Node2D
class_name HealthComponent
signal on_death(entity:Entity)
signal on_damage()
@export var max_health : int
var health : float = max_health

func _process(delta):

	if health <= 0:
		_death()
	health -= .05
func _ready():
	health = max_health
func _damage(attack:Attack):
	health -= attack.attack_damage
	on_damage.emit(health)
func _death():
	on_death.emit(self)
