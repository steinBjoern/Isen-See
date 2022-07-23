extends Camera2D

var avatar : Node2D

var zoom_factor = 1.2
#onready var game = get_tree().get_root().get_node('/root/Hulls')
onready var zoom_base : Vector2 = zoom
onready var zoom_aim : float = zoom.length()

func _ready():
	print( 'hello player (Camera2D)')
	


func _process( _delta):
	update_avatar()
	update_camera()
	goal_update()



func _input( event):
	avatar_control( event)
	camera_control( event)


func follow_avatar():
	if avatar:
		global_position = (avatar.global_position  + get_global_mouse_position()) / 2
		
	


func update_camera():
	follow_avatar()
	zoom = zoom_base.normalized() * lerp( zoom.length(), zoom_aim, zoom_factor)
	


func avatar_control( event : InputEvent):
	if avatar:
		direct_control( event)
		goal_control( event)
		
	


func goal_control( event : InputEvent):
		if event.is_action_pressed( 'loosen'):
			avatar.mv.erase( 'goal')
			avatar.mv.erase( 'goal_angle')
			
		
	


func goal_update():
	if avatar:
		if Input.is_action_pressed( 'point_select'):
			avatar.mv.goal = get_global_mouse_position()
			
		if Input.is_action_pressed( 'point_option'):
			avatar.mv.goal_angle = avatar.global_position.angle_to_point( get_global_mouse_position()) + PI
			
		
	


func direct_control( event : InputEvent):
		var actions = [ 'ui_up', 'ui_down', 'ui_left', 'ui_right']
		var directions = [ Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
		
		var i : = 0
		for a in actions:
			if event.is_action_pressed( a):
				avatar.mv.direction += directions[ i]
				
			if event.is_action_released( a):
				avatar.mv.direction -= directions[ i]
				
			i += 1
			
		
	


func camera_control( event : InputEvent):
	if event.is_action_pressed( 'zoom_in'):
		zoom_aim *= zoom_factor
		
	if event.is_action_pressed( 'zoom_out'):
		zoom_aim /= zoom_factor
		
	


func update_avatar():
	var candidates = get_tree().get_nodes_in_group( 'avatar')
	if candidates.size() > 1:
		avatar.remove_from_group( 'avatar')
		if not set_avatar( candidates.back()):
			avatar.add_to_group( 'avatar')
			
		
	


func set_avatar( new_avatar : Node2D) -> bool:
	if new_avatar.has_method('get_mv'):
		avatar = new_avatar
		return true
	else:
		print( 'If it cant react to you, it cant be your avatar.')
		return false
		
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
