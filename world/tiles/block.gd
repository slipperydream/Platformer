extends StaticBody2D

class_name Block

@export var image : Texture2D
@export_range(1,20) var num_uses : int = 1
var times_hit : int = 0
@export var active : bool = false

func _ready():
	$Sprite2D.texture = image
		
	
func is_still_active():	
	if times_hit >= num_uses:
		active = false

func hit():
	times_hit += 1
	is_still_active()
