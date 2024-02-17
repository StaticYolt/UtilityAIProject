extends CharacterBody2D
@export var gravity = 200
@export var move_speed = 2
@export var anim : AnimationPlayer
@export var sprite : Sprite2D
var left_last_pressed : bool
func _process(delta):
	anim.play("swim")
	velocity.y += gravity * delta

	sprite.flip_h = left_last_pressed
	move_and_slide()
func _ready():
	GameInputManager.connect("onSpacePressed", _on_gameinputmanager_space_pressed)
	GameInputManager.connect("onLeftArrowPressed", _on_gameinputmanager_left_pressed)
	GameInputManager.connect("onRightArrowPressed", _on_gameinputmanager_right_pressed)

func _on_gameinputmanager_space_pressed():
	velocity.y -= 80
func _on_gameinputmanager_right_pressed():
	position.x += move_speed
	left_last_pressed = false
func _on_gameinputmanager_left_pressed():
	position.x -= move_speed
	left_last_pressed = true
