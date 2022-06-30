extends Control

onready var game = get_tree().root.get_node('Game')

func _ready():
	print( 'hello game menu')
	

func _on_Button_pressed():
	game.start_game()
	$Start.hide()
	$End.show()
	pass # Replace with function body.
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT


func _on_End_pressed():
	get_tree().quit()
