extends Camera2D
@export var step : float
var self_zoom : Vector2
@export var min_zoom : float
@export var max_zoom : float
func _ready():
	GameInputManager.connect("onUpPressed", _on_gameinputmanager_up_pressed)
	GameInputManager.connect("onDownPressed", _on_gameinputmanager_down_pressed)
	GameInputManager.connect("onLeftPressed", _on_gameinputmanager_left_pressed)
	GameInputManager.connect("onRightPressed", _on_gameinputmanager_right_pressed)
	GameInputManager.connect("onScrollUp", _GameInputManager_on_scroll_up)
	GameInputManager.connect("onScrollDown", _GameInputManager_on_scroll_down)

func _process(delta):
	zoom = self_zoom
func _GameInputManager_on_scroll_up():
	if self_zoom < Vector2(max_zoom, max_zoom):
		self_zoom.x += .1
		self_zoom.y += .1
func _GameInputManager_on_scroll_down():
	if self_zoom > Vector2(min_zoom, min_zoom):
		self_zoom.x -= .1
		self_zoom.y -= .1
func _on_gameinputmanager_up_pressed():
	position.y -= step
func _on_gameinputmanager_down_pressed():
	position.y += step
func _on_gameinputmanager_right_pressed():
	position.x += step
func _on_gameinputmanager_left_pressed():
	position.x -= step
