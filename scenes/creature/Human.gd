extends KinematicBody2D

var at : Dictionary = {
	'hitpoints' : 1024,
	'max_hp' : 1024,
}

# move and velocity state
export var mv : Dictionary = {
	'speed' : 900,
}

func _input( event):
	control_dev( event)
	control_move( event)
	


func _process( delta):
	move( delta)


func move( delta):
	if mv.has( 'goal') and mv.goal is Vector2:
		if global_position.distance_to( mv.goal) <= mv.speed * delta:
			global_position = mv.goal
		else:
			var dir = global_position.direction_to( mv.goal)
			move_and_slide( mv.speed * dir)
			
		
	


func control_move( event : InputEvent):
	if event.is_action_pressed( 'point_select'):
		mv.goal = get_global_mouse_position()
	if (event is InputEventMouseMotion 
	and Input.is_action_pressed( 'point_select')):
		mv.goal = get_global_mouse_position()
		
	


func control_dev( event : InputEvent):
	if event.is_action_pressed('ui_select'):
		set_collision_layer_bit(1, false)
		
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
