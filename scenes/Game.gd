extends Node

# node reference
var nr : Dictionary = {}

func _ready():
	randomize()
	print( 'hello game')
	create_player()
	


func create_player():
	var player = load( 'res://scenes/a_player/Player.tscn').instance()
	add_child( player)
	nr.player = player
	


func start_game():
	var space = load( 'res://scenes/Space.tscn').instance()
	add_child( space)
	nr.space = space
	remove_child( nr.player)
	space.add_child( nr.player)
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
