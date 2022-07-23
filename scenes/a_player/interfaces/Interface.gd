extends Control

var current_menu : String = 'game'

var menu_keys = [
	'game', 'crafting'
]

var exits : Dictionary = {
	'' : menu_keys,
	'game' : [],
	'crafting' : ['game'],
}

var conditions : Dictionary = {
	'crafting' : 'game_started',
}

onready var menus : Dictionary = {
	'game' : get_node( 'GameMenu'),
	'crafting' : get_node( 'CraftingMenu'),
}

func _input( event):
	menu_control( event)
	


func menu_control( event : InputEvent):
	for n in menu_keys:
		if event.is_action_pressed( n):
			if menus[ n].visible:
				close_menu( n)
				
			elif exits[ current_menu].has( n):
				if not conditions.has( n) or call( conditions[ n]):
					if current_menu != '':
						close_menu( current_menu)
					open_menu( n)
					
				
			
		
	


func open_menu( key : String):
	get_tree().set_pause( true)
	menus[ key].show()
	current_menu = key
	


func close_menu( key : String):
	get_tree().set_pause( false)
	menus[ key].hide()
	current_menu = ''
	


func game_started() -> bool:
	return get_node( '../../') is Node2D
	

# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
