extends State
class_name Walk

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		if direction < 0:
			player.sprites.play("walk_left")
		elif direction > 0:
			player.sprites.play("walk_right")
		player.velocity.x = direction * player.speed
	else:	
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
		
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
		
	if Input.is_action_just_pressed("duck"):
		Transitioned.emit(self, "duck")
		
	if abs(0 - player.velocity.x) < 0.0001:
		Transitioned.emit(self, "idle")
		

