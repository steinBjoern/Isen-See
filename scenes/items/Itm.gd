extends CollisionShape2D
class_name Itm

export var category : = ''
export var type : = ""

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

#func _init():
#	pass

func _ready():
	print( 'hello ', category, ' item')
	yield(get_tree(), 'idle_frame')
	setup_item()
	set_random_color()
	


func setup_item():
	if Itms.d.has( category) :
		if Itms.d[ category].has( type):
			var texture = load( Itms.d[ category][ type][ 'image'])
			var size : Vector2 = texture.get_size()
			# configure nodes
			$Sprite.set_texture( texture)
			var new_shape = Itms.d[ category][ type][ 'shape'].new()
			if new_shape is RectangleShape2D:
				new_shape.set_extents( size / 2.2)
			if new_shape is CircleShape2D:
				new_shape.set_radius( size.x / 2.2)
			if new_shape is CapsuleShape2D:
				new_shape.set_radius( size.x / 2.2)
				new_shape.set_height( (size.y - 2 * new_shape.radius) / 2.2)
			set_shape( new_shape)
			# setup attributes
			at.max_hp = size.x * size.y
	#		at.hitpoints = at.max_hpQ
			print( 'hitpoints : ', at.hitpoints, '/', at.max_hp)
		else:
			print( "item type doesn't exist")
	else:
		print( "item category doesn't exist")
		
	


func set_random_color():
	var r = randf()
	var g = randf()
	var b = randf()
	
	while r + g + b < .2:
		r = min( 1, r + randf())
		g = min( 1, r + randf())
		b = min( 1, r + randf())
		
	set_modulate( Color( r, g, b, 1))
	

