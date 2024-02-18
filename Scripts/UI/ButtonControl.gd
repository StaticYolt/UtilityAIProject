extends Control
class_name ButtonControl
signal on_purple_fish()
signal on_red_fish()
signal on_yellow_fish()


func _on_purple_fish_pressed():
	on_purple_fish.emit(2)


func _on_red_fish_pressed():
	on_red_fish.emit(1)


func _on_yellow_fish_pressed():
	on_yellow_fish.emit(0)
