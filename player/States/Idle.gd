extends State
class_name Idle



func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	player.sprites.play("idle")
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		Transitioned.emit(self, "walk")
		
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
	
	if Input.is_action_just_pressed("duck"):
		Transitioned.emit(self, "duck")
