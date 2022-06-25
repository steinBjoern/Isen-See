extends Control

var current_menu : String = ''

var menu_names = [
	'crafting'
]

var exits : Dictionary = {
	'game' : [],
	'crafting' : [],
}

onready var menus : Dictionary = {
	'game' : get_node( 'GameMenu'),
	'crafting' : get_node( 'Crafting'),
}

func _input( event):
	toggle_menu( event)
	


func toggle_menu( event : InputEvent):
	for n in menu_names:
		if event.is_action_pressed( n):
			if menus[ n].visible:
				menus[ n].hide()
				current_menu = ''
			else:
				menus[ n].show()
				current_menu = n
				
			
		
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
