extends Control

var craft : RigidBody2D

onready var game = get_tree().root.get_node( "Game")

func _ready():
	print( 'hello Ship-Crafting')
	

func _on_Ship_pressed():
	create_ship_with_hull()
	

func _on_Hull_pressed():
	create_hull_as_pickable_item()
	

func _on_Light_pressed():
	create_random_light()


func create_ship_with_hull():
	print( 'go shipbutton')
	var new_ship = load( 'res://scenes/starship/Ship.tscn').instance()
	craft = new_ship
	craft.add_to_group( 'workpiece')
	var new_hull = load( 'res://scenes/starship/Hull.tscn').instance()
	new_hull.type = 'Saucer'
	new_ship.add_child( new_hull)
	new_ship.global_position = get_node('../../').global_position
	game.nr.space.add_child( new_ship)
	


func create_hull_as_pickable_item():
	print( 'go hullbutton')
	var item_picker : Area2D = load( 'res://scenes/a_player/crafting/ItemPicker.tscn').instance()
	var hull = load( 'res://scenes/starship/Hull.tscn').instance()
	hull.type = "Test"
	item_picker.add_child( hull)
	item_picker.global_position = get_node('../../').global_position
	game.nr.space.add_child( item_picker)
	


func create_random_light():
	var new_light : Light2D = Light2D.new()
	var r = rand_range( 0.1, 1)
	var g = rand_range( 0.1, 1)
	var b = rand_range( 0.1, 1)
	new_light.set_color( Color( r, g, b, 1))
	new_light.set_energy( rand_range( 0.1, 1))
	new_light.global_position = get_node( '../../').global_position
	new_light.set_texture_scale( rand_range( .2, 2))
	new_light.set_texture( load('res://icon.png'))
	game.nr.space.add_child( new_light)
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
