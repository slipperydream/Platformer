extends Item

class_name Gem

signal gem_collected

@export var value : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func spawn(pos):
	super.spawn(pos)
	$AnimationPlayer.play("spawn")

func collect():
	emit_signal("gem_collected", value)
	remove()
	
func remove():
	queue_free()

