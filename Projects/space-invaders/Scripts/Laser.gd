extends Area2D

@export var laserSpeed : float

func _physics_process(delta):
	
	#Make the laser move up on the screen
	position.y -= laserSpeed * delta


func _on_is_visible_screen_exited():
	
	# When the bullet leaves the scree, remove it from the tree
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body._hit()
		queue_free()
