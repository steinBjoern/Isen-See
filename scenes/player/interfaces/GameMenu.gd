extends Control

onready var game = get_tree().root.get_node('Game')

func _ready():
	print( 'hello game menu')
	

func _on_Start_pressed():
	game.start_game()
	$Start.hide()
	$End.show()
	$Continue.show()
	get_parent().close_menu( 'game')
	pass # Replace with function body.
	


func _on_End_pressed():
	get_tree().quit()
	


func _on_Continue_pressed():
	get_parent().close_menu( 'game')
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
