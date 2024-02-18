extends Node2D
signal onUpPressed()
signal onDownPressed()
signal onLeftPressed()
signal onRightPressed()
signal onSpacePressed()
signal onUpArrowPressed()
signal onDownArrowPressed()
signal onRightArrowPressed()
signal onLeftArrowPressed()
signal onScrollUp()
signal onScrollDown()

func _process(delta):
	if Input.is_action_pressed("up"):
		onUpPressed.emit()
	if Input.is_action_pressed("down"):
		onDownPressed.emit()
	if Input.is_action_pressed("left"):
		onLeftPressed.emit()
	if Input.is_action_pressed("right"):
		onRightPressed.emit()
	if Input.is_action_pressed("up_arrow"):
		onUpArrowPressed.emit()
	if Input.is_action_pressed("down_arrow"):
		onDownArrowPressed.emit()
	if Input.is_action_pressed("left_arrow"):
		onLeftArrowPressed.emit()
	if Input.is_action_pressed("right_arrow"):
		onRightArrowPressed.emit()
	if Input.is_action_just_pressed("space"):
		onSpacePressed.emit()
	if Input.is_action_just_pressed("scroll_up"):
		onScrollUp.emit()
	if Input.is_action_just_pressed("scroll_down"):
		onScrollDown.emit()
