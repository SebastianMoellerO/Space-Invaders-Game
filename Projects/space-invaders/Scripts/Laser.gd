extends Area2D

@export var laserSpeed : float

func _physics_process(delta):
	
	#Make the laser move up on the screen
	position.y -= laserSpeed * delta


#func _on_is_visible_screen_exited():
	#queue_free()
