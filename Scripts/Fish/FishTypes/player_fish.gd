extends Entity

#@export var areaSize = Vector2(500, 500)
# Variables
var targetPosition = Vector2()
var left_last_pressed : bool
func _process(delta):
	if velocity.y < gravity:
		velocity.y += gravity * delta
#	print(velocity)
#	print(hitbox_component.get_overlapping_bodies())
#	print(hitbox_component.get_overlapping_areas())
	visual_component.sprite.flip_h = left_last_pressed
	move_and_slide()
	
func _ready():
	GameInputManager.connect("onSpacePressed", _on_gameinputmanager_space_pressed)
	GameInputManager.connect("onLeftArrowPressed", _on_gameinputmanager_left_pressed)
	GameInputManager.connect("onRightArrowPressed", _on_gameinputmanager_right_pressed)

func _on_gameinputmanager_space_pressed():
	velocity.y -= 60
func _on_gameinputmanager_right_pressed():
	position.x += move_speed
	left_last_pressed = false
func _on_gameinputmanager_left_pressed():
	position.x -= move_speed
	left_last_pressed = true
#func _ready():
#	_move()
#
#func _process(delta):
#	# Move towards the target position
#	var direction = (targetPosition - position).normalized()
#	move_and_collide(direction * movementSpeed * delta)
#
#	# Check if the object has reached the target position
#	if position.distance_to(targetPosition) < 10:
#		_move()
#func _move():
## Generate a random target position within the specified area
#	targetPosition = Vector2(randf_range(-areaSize.x / 2, areaSize.x / 2), randf_range(-areaSize.y / 2, areaSize.y / 2))

	
