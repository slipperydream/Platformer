extends Area2D

class_name Door

@export var connection : Door
@export var is_locked : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_door_textures(is_locked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area is Key:
		if is_locked:
			is_locked = false
			area.collect()
			set_door_textures(is_locked)
			
func set_door_textures(locked):
	if locked:
		$Sprite2D.texture = load("res://world/tiles/platformPack_tile051.png")
		$Sprite2D2.texture = load("res://world/tiles/platformPack_tile060.png")
	else:
		$Sprite2D.texture = load("res://world/tiles/platformPack_tile048.png")
		$Sprite2D2.texture = load("res://world/tiles/platformPack_tile057.png")


func _on_body_entered(body):
	if not is_locked:
		if body is Player or body is Enemy:
			body.global_position = Vector2(connection.global_position.x+64, connection.global_position.y)
