extends TileMap

enum ti {
	WALL,
	FLOOR,
	LIMIT,
}

onready var texture : Texture = load( 'res://assets/images/items/hull/Saucer.PNG')
func _ready():
	randomize()
	generate_interior()
	random_coloration()


func generate_interior():
	fill()
	return


func fill():
	var size = texture.get_size()
	var all = size.x * size.y
	for x in range( -size.x / 2, size.x / 2 ):
		for y in range( -size.y / 2, size.y / 2):
			if $Sprite.is_pixel_opaque( Vector2( x, y)):
				set_cell( x , y , ti.WALL)

func random_coloration():
	for tid in tile_set.get_tiles_ids():
		tile_set.tile_set_modulate( tid, random_color())

func random_color() -> Color:
	var r = randf()
	var g = randf()
	var b = randf()
	
	while r + g + b < .1:
		r = min( 1, r + randf())
		g = min( 1, r + randf())
		b = min( 1, r + randf())
		
	
	return Color( r, g, b, 1)
