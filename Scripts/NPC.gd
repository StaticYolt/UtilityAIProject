extends Node2D

@export var hunger = 0
func _ready():
	print("Hello World")

func _process(delta):
#	print(find_child("UtilityAiAgent")._action_scores)
	_handle_hunger(delta)
#	print(hunger)

func _handle_hunger(delta):
	hunger = clampf(hunger + delta * 10, 0, 100)

func _eat():
	hunger = 0

func _on_utility_ai_agent_top_score_action_changed(top_action_id):
	print("Action changed: %s" % top_action_id)
	
	match top_action_id:
		"eat":
			_eat()
