extends State
class_name Duck

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	if Input.is_action_just_released("duck"):
		Transitioned.emit(self, "idle")
	if Input.is_action_pressed("duck"):
		player.sprites.play("duck")
	
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		Transitioned.emit(self, "walk")
	
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
	
