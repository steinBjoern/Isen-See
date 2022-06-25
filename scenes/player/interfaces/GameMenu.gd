extends Control

onready var game = get_tree().root.get_node('Game')

func _ready():
	print( 'hello game menu')
	

func _on_Button_pressed():
	game.start_game()
	hide()
	pass # Replace with function body.
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
