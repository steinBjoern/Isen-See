extends Control

var current_menu : String = ''

var menu_names = [
	'game', 'crafting'
]

var exits : Dictionary = {
	'' : menu_names,
	'game' : [],
	'crafting' : ['game'],
}

onready var menus : Dictionary = {
	'game' : get_node( 'GameMenu'),
	'crafting' : get_node( 'CraftingMenu'),
}

func _input( event):
	toggle_menu( event)
	


func toggle_menu( event : InputEvent):
	for n in menu_names:
		if event.is_action_pressed( n):
			if menus[ n].visible:
				get_tree().set_pause( false)
				menus[ n].hide()
				current_menu = ''
				
			elif exits[ current_menu].has( n):
				get_tree().set_pause( true)
				if current_menu != '':
					menus[ current_menu].hide()
					
				menus[ n].show()
				current_menu = n
				
			
		
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
