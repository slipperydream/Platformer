extends State
class_name Jump
var can_double_jump : bool = true
var is_ground_pound : bool = false

func enter():
	player.velocity.y = player.jump_velocity
	player.sprites.play("jump")
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):	
	if Input.is_action_just_pressed("jump"):
		if player.is_on_wall():
			print('on the wall')
			player.velocity = player.velocity.bounce(Vector2.UP)
		else:
			if can_double_jump:
				can_double_jump = false
				player.velocity.y = player.jump_velocity
				player.sprites.play("jump")
		is_ground_pound = false
	
	if Input.is_action_just_pressed("duck"):
		is_ground_pound = true
		player.velocity.y = -1 * player.jump_velocity/2
		player.sprites.play("duck")
	
	if player.is_on_floor():
		Transitioned.emit(self, "idle")
			
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		Transitioned.emit(self, "walk")
		
	for index in player.get_slide_collision_count():
		var collision = player.get_slide_collision(index)
		var body = collision.get_collider()
		if body is Block:
			if player.is_on_ceiling() or is_ground_pound:
				body.hit()
	
	
