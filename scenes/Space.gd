extends Node2D
class_name Space

onready var game = get_parent()

func _ready():
	print( 'hello space')
	create_avatar()
	


func create_avatar():
	var avatar = load( 'res://scenes/creature/Human.tscn').instance()
	avatar.set_global_position( $Testlevel.global_position)
	add_child( avatar)
	game.nr.player.set_avatar( avatar)
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
