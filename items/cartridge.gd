extends Item

class_name Cartridge

signal cartridge_ejected
signal cartridge_inserted

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

func spawn(pos):
	super.spawn(pos)
	$AnimationPlayer.play("spawn")

func collect():
	emit_signal("cartridge_inserted")
	remove()
	
func remove():
	queue_free()
