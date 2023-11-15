extends CharacterBody2D

class_name Enemy

signal died

const SPEED = 100.0


@onready var health = $HealthComponent
@onready var sprites = $AnimatedSprite2D
@onready var timer = $Timer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.ZERO

func _ready():
	timer.start()
	direction = Vector2.LEFT
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	if direction.x < 0:
		sprites.flip_h = true
	elif direction.x > 0:
		sprites.flip_h = false
	sprites.play("walk")
	velocity.x = direction.x * SPEED
	move_and_slide()

func _on_health_component_killed():
	emit_signal("died")
	sprites.play("died")
	await sprites.animation_finished
	queue_free()

func _on_timer_timeout():
	if direction == Vector2.LEFT:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT
