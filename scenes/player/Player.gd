extends Camera2D

var avatar : Node2D

func _ready():
	print( 'hello player (Camera2D)')
	


func _process( _delta):
	follow_avatar()
	update_avatar()


func _input( event):
	avatar_control( event)
	


func follow_avatar():
	if avatar:
		global_position = avatar.global_position
		
	


func avatar_control( event : InputEvent):
	if avatar:
		if event.is_action_pressed( 'point_select'):
			avatar.mv.goal = get_global_mouse_position()
			
		if (event is InputEventMouseMotion 
		and Input.is_action_pressed( 'point_select')):
			avatar.mv.goal = get_global_mouse_position()
			
		
	

func update_avatar():
	var candidates = get_tree().get_nodes_in_group( 'avatar')
	if candidates.size() > 1:
		var i = 0
		if candidates.size() > 1:
			avatar.remove_from_group( 'avatar')
			set_avatar( candidates.back())
				
			
		
	


func set_avatar( new_avatar : Node2D) -> bool:
	if new_avatar.has_method('get_mv'):
		avatar = new_avatar
		print( 'hello candidate')
		return true
	else:
		print( 'If it cant react to you, it cant be your avatar.')
		return false
		
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
