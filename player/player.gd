extends CharacterBody2D

class_name Player

signal died
signal hit

const SPEED = 300.0
const JUMP_VELOCITY = -650.0

@onready var health = $HealthComponent
@onready var sprites = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Camera2D.enabled = true
	$Camera2D.position_smoothing_enabled = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		sprites.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		if direction < 0:
			sprites.play("walk_left")
		elif direction > 0:
			sprites.play("walk_right")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("duck"):
		sprites.play("duck")
	move_and_slide()


func _on_health_component_killed(_source):
	emit_signal("died")


func _on_health_component_hit():
	if health.invulnerable:
		return
	else:
		scale.x *= 0.33
