extends ParallaxLayer
@export var scroll_speed : float
func _process(delta) -> void:
	self.motion_offset.x += scroll_speed * delta
