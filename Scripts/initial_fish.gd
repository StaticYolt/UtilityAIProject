extends CharacterBody2D
@export var movementSpeed = 100
@export var areaSize = Vector2(500, 500)
@export var anim : AnimationPlayer
# Variables
var targetPosition = Vector2()

func _ready():
	set_random_target()

func _process(delta):
	anim.play("swim")
	# Move towards the target position
	var direction = (targetPosition - position).normalized()
	move_and_collide(direction * movementSpeed * delta)

	# Check if the object has reached the target position
	if position.distance_to(targetPosition) < 10:
		set_random_target()

func set_random_target():
	# Generate a random target position within the specified area
	targetPosition = Vector2(randf_range(-areaSize.x / 2, areaSize.x / 2),
							 randf_range(-areaSize.y / 2, areaSize.y / 2))
