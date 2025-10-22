extends Node2D

var width : int = 10
var height : int = 4

var stepLenght : float = 10
var stepAmount : int = 7 # Should not be even!
var remainingSteps : int = (stepAmount + 1) / 2
var direction : int = 1 # Should only be 1 or -1


func _ready():
	var Enemy = preload("res://Scenes/enemy.tscn")
	
	var spawn_x = 15
	
	for i in range(width):
		
		var spawn_y = 10
		
		for j in range(height):
			var enemy = Enemy.instantiate()
			enemy.position = Vector2(spawn_x,spawn_y)
			add_child(enemy)
			
			spawn_y += 20
		
		spawn_x += 20
	
	move()
	

func move():
	position.x += stepLenght * direction
	remainingSteps -= 1
	if remainingSteps <= 0:
		_switchDirection()
	await get_tree().create_timer(0.3).timeout
	self.move()

func _switchDirection():
	direction *= -1
	remainingSteps = stepAmount
	
