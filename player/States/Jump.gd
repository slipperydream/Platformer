extends State
class_name Jump
var can_double_jump : bool = true

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
	
	if player.is_on_floor():
		Transitioned.emit(self, "idle")
			
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		Transitioned.emit(self, "walk")
	
	
