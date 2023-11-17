extends Block

class_name ItemBlock

@export var item_scene : PackedScene
@export var used_texture : Texture2D

func _ready():
	super._ready()
		
func spawn_item():
	var item = item_scene.instantiate()
	get_parent().call_deferred("add_child", item)
	item.spawn(global_position)
	
func is_still_active():	
	super.is_still_active()
	if active == false:
		$Sprite2D.texture = used_texture

func hit():
	if active:
		spawn_item()
		$AnimationPlayer.play('hit')
		super.hit()
