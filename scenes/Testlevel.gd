extends Sprite


func _ready():
	var r = randf()
	var g = randf()
	var b = randf()
	
	while r + g + b < .1:
		r = min( 1, r + randf())
		g = min( 1, r + randf())
		b = min( 1, r + randf())
		
	
	set_self_modulate( Color( r, g, b, 1))

