extends Camera2D

var avatar : Node2D

func _ready():
	print( 'hello player (Camera2D)')
	


func _process( _delta):
	if avatar:
		global_position = avatar.global_position
	


func set_avatar( new_avatar : Node2D):
	avatar = new_avatar
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
