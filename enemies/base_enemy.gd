extends CharacterBody2D

class_name Enemy

signal died

@export var speed = 100.0


@onready var health = $HealthComponent
@onready var hurtbox = $HurtboxComponent
@onready var hitbox = $HitboxComponent
@onready var sprites = $Sprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.ZERO

func _ready():
	direction = Vector2.LEFT
	
func _physics_process(delta):
	# Add the gravity.
	if health.is_dead:
		return
	if not is_on_floor():
		velocity.y += gravity * delta


	if direction.x < 0:
		sprites.flip_h = true
	elif direction.x > 0:
		sprites.flip_h = false
	velocity.x = direction.x * speed
	move_and_slide()

func _on_health_component_killed(_source):
	emit_signal("died")

func _on_died():
	queue_free()
	
func spawn(pos):
	global_position = pos
