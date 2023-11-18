extends Enemy

class_name Walker

@onready var timer = $Timer
@onready var animation_player = $AnimationPlayer
@export var patrol_time : float = 3

func _ready():
	super._ready()
	timer.wait_time = patrol_time
	timer.start()

func _on_timer_timeout():
	if direction == Vector2.LEFT:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT
	animation_player.play("walk")
	timer.start()

