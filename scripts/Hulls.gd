extends Node

var hulls_dir : String = 'res://assets/images/starship/hulls/'

func _ready():
	print( 'hello hulls script')

var data : Dictionary = {
	"Saucer" : {
		'image' : str(hulls_dir, 'Saucer', '.PNG'),
		'shape' : CircleShape2D,
	},
	"Test" : {
		'image' : str(hulls_dir, 'Test', '.PNG'),
		'shape' : RectangleShape2D,
	}
}

# I fancy having a real noice tool that leaves me lazee:
#func determine_hullshape():
#	var size
#	var opaque : int
#	var all = size.x * size.y
#	for x in range( -size.x / 2, size.x / 2 ):
#		for y in range( -size.y / 2, size.y / 2):
#			if $Sprite.is_pixel_opaque( Vector2( x, y)):
#				opaque += 1
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
