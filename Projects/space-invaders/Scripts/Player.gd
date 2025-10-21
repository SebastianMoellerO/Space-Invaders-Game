extends CharacterBody2D

@export var playerSpeed : float
@export var playerAcceleration : float

func _physics_process(delta):

	#Get the Direction based on the input
	var direction = Input.get_action_raw_strength("MoveRight") -Input.get_action_raw_strength("MoveLeft")
	
	#Calculate the velocity of the player, based on the direction and acceleration
	velocity.x = lerp(velocity.x, playerSpeed * direction, playerAcceleration * delta)
	
	# Make the player movedadadada
	move_and_slide()
