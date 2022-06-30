extends KinematicBody2D

var at : Dictionary = {
	'hitpoints' : 1024,
	'max_hp' : 1024,
}

# move and velocity state
export var mv : Dictionary = {
	'speed' : 900,
}


func _process( delta):
	move( delta)


func move( delta):
	if mv.has( 'goal') and mv.goal is Vector2:
		if global_position.distance_to( mv.goal) <= mv.speed * delta:
			global_position = mv.goal
			mv.erase('goal')
		else:
			var dir = global_position.direction_to( mv.goal)
			move_and_slide( mv.speed * dir)
			
		
	


func get_mv() -> Dictionary:
	return mv
# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
