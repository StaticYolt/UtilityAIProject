extends Node2D
var npcfish1 = preload("res://Scenes/Fish/npc_fish_1.tscn")
@export var npc_move_area : Area2D

func _ready():
	for i in range(2):
		var tempfish = npcfish1.instantiate()
		tempfish.move_area = npc_move_area
		tempfish.move_speed = 50
		add_child(tempfish)
