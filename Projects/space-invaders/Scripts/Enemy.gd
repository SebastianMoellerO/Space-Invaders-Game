extends CharacterBody2D

@export var health : int

func _hit():
	
	# Take damage
	health -= 1
	
	# If out of HP, the enemy dies
	if health <= 0:
		_death()


func _death():
	queue_free()
