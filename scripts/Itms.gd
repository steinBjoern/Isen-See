extends Node

var img_dir : String = 'res://assets/images/items/'


var d : Dictionary = {
	'hull' : {
		"Saucer" : {
			'image' : str(img_dir, 'hull/', "Saucer", '.PNG'),
			'shape' : CircleShape2D,
		},
		"Test" : {
			'image' : str(img_dir, 'hull/', "Test", '.PNG'),
			'shape' : RectangleShape2D,
		},
	},
	'weapon' : {
		"MiniGun" : {
			'image' : str(img_dir, 'weapon/', "MiniGun", '.PNG'),
			'shape' : CircleShape2D,
		},
		"SmolGun" : {
			'image' : str(img_dir, 'weapon/', "SmolGun", '.PNG'),
			'shape' : CircleShape2D,
		}
	}
}



func _ready():
	print( 'hello items data sript')
#	initialize_data()
#	dir_contents( img_dir)
#
#
#func initialize_data():
#	print( 'initialize hull data')
#	var keys : Array = [
#	'Saucer', 'Test'
#	]
#	for k in keys:
#		return 7003
#
#
#func dir_contents(path):
#	var dir = Directory.new()
#	if dir.open( path) == OK:
#		dir.list_dir_begin( 1)
#		var file_name = dir.get_next()
#		while file_name != "":
#			if dir.current_is_dir():
#				print("Found directory: " + file_name)
#			elif not file_name.ends_with( '.import'):
#				print("Found file: " + file_name)
#			file_name = dir.get_next()
#	else:
#		print("An error occurred when trying to access the path.")


# I'd still like if the shape could be read out.
#func determine_hullshapes():
#	pass
#
#func determine_hullshape( texture : Texture):
#	var size = texture.get_size()
#	var opaque : int
#	var all = size.x * size.y
#	for x in range( -size.x / 2, size.x / 2 ):
#		for y in range( -size.y / 2, size.y / 2):
#			if $Sprite.is_pixel_opaque( Vector2( x, y)):
#				opaque += 1
#
#
#	if opaque > .9 * all:
#		return RectangleShape2D 
#	elif opaque > .9 * all/4 * PI and opaque < 1.1 * all/4 * PI:
#		return CircleShape2D
#	else :
#		return CapsuleShape2D
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
