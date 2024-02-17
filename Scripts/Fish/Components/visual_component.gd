extends Node2D
class_name VisualComponent
@export var sprite : Sprite2D
@export var animation_player : AnimationPlayer
@export var animation_tree : AnimationTree
#@onready var state_machine = animation_tree.get("parameters/playback")
#
#func _change_state(state:State):
#	state_machine.travel(state.state_travel)
	
func _update_paramaters(parameter_path:String, parameter_value):
	animation_tree.set(parameter_path, parameter_value)
func _flip_horizontal(b:bool):
	if b:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
