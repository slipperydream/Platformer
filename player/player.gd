extends CharacterBody2D

class_name Player

signal died
signal hit

@export var speed : int = 300
@export var jump_velocity : int = -675

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
	
	move_and_slide()
	
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		var body = collision.get_collider()
		if body is Block:
			if is_on_ceiling():
				body.hit()

func _on_health_component_killed(_source):
	emit_signal("died")

func _on_health_component_hit():
	if health.invulnerable:
		return
	else:
		scale.x *= 0.33

func _on_pickup_area_entered(area):
	if area is Item:
		if area is Cartridge:
			$AnimationPlayer.play("pickup")
		area.collect()
