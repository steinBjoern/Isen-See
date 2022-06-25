extends CollisionShape2D

export var type : = ""

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

func _ready():
	print( 'hello hull')
	setup_hull()
	set_random_color()
	


func setup_hull():
	if Hulls.data.has( type):
		var texture = load( Hulls.data[ type].image)
		var size : Vector2 = texture.get_size()
		# configure nodes
		$Sprite.set_texture( texture)
		var new_shape = Hulls.data[ type].shape.new()
		if new_shape is RectangleShape2D:
			new_shape.set_extents( size / 2.2)
		if new_shape is CircleShape2D:
			new_shape.set_radius( size.x / 2.2)
		if new_shape is CapsuleShape2D:
			new_shape.set_radius( size.x / 2.2 )
			new_shape.set_height( (size.y - 2 * new_shape.radius) / 2.2)
		set_shape( new_shape)
		# setup attributes
		at.max_hp = size.x * size.y
#		at.hitpoints = at.max_hpQ
		print( 'hitpoints : ', at.hitpoints, '/', at.max_hp)
	else:
		print( "hull type doesn't exist")
		
	


func set_random_color():
	var r = rand_range(0.0, 1)
	var g = rand_range(0.0, 1)
	var b = rand_range(0.0, 1)
	if r + g + b < 0.9:
		r += .3; g += .3; b += .3
	set_modulate( Color( r, g, b, 1))
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
