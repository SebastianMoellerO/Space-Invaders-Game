extends CharacterBody2D

@export var playerSpeed : float
@export var playerAcceleration : float

@export var laserCooldown : float = 1

var LASER = preload("res://Scenes/laser.tscn")

var canShoot : bool = true

func _physics_process(delta):

	#Get the Direction based on the input
	var direction = Input.get_action_raw_strength("MoveRight") -Input.get_action_raw_strength("MoveLeft")
	
	#Calculate the velocity of the player, based on the direction and acceleration
	velocity.x = lerp(velocity.x, playerSpeed * direction, playerAcceleration * delta)
	
	#Make the player movedadadada
	move_and_slide()
	
	#Check if the player is shooting
	if Input.is_action_pressed("Shoot"):
		_shoot()

func _shoot() -> void:
	if canShoot:
		canShoot = false
		
		var laser = LASER.instantiate()
		laser.position = position
		add_sibling(laser)
		await get_tree().create_timer(laserCooldown).timeout
		canShoot = true
		
	
