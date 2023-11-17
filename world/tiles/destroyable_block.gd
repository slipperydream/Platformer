extends Block

class_name DestroyableBlock

func _ready():
	super._ready()
	
func is_still_active():	
	super.is_still_active()
	if active == false:
		$Sprite2D.visible = false
		$GPUParticles2D.emitting = true
		await get_tree().create_timer(0.5).timeout
		queue_free()
