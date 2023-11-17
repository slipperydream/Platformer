extends Node
class_name State

@onready var player = get_tree().get_first_node_in_group("player")

signal Transitioned

func enter():
	pass
	
func exit():
	pass
	
func handle_input(_event):
	pass
	
func update(_delta):
	pass
	
func physics_update(delta):
	pass
	
