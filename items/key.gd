extends Item

class_name Key
signal door_unlocked

func _ready():
	super._ready()

func collect():
	door_unlocked.emit()
	queue_free()

func _on_area_entered(area):
	pass

func pickup(parent, pos):
	reparent(parent)
	position = pos
