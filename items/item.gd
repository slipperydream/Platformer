extends Area2D

class_name Item
@export var image : Texture2D

func _ready():
	$Sprite2D.texture = image

func spawn(pos):
	global_position = pos
	
func collect():
	pass
	
func _on_area_entered(area):
	pass # Replace with function body.
