extends Camera2D
@export var step : float
func _ready():
	GameInputManager.connect("onUpPressed", _on_gameinputmanager_up_pressed)
	GameInputManager.connect("onDownPressed", _on_gameinputmanager_down_pressed)
	GameInputManager.connect("onLeftPressed", _on_gameinputmanager_left_pressed)
	GameInputManager.connect("onRightPressed", _on_gameinputmanager_right_pressed)
func _on_gameinputmanager_up_pressed():
	position.y -= step
func _on_gameinputmanager_down_pressed():
	position.y += step
func _on_gameinputmanager_right_pressed():
	position.x += step
func _on_gameinputmanager_left_pressed():
	position.x -= step
