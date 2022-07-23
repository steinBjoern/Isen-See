extends Sprite


func _ready():
	var r = rand_range(0, 1) 
	var g = rand_range(0, 1) 
	var b = rand_range(0, 1) 
	if r + g + b < .7:
		r += .3
		g += .3
		b += .3
	set_self_modulate( Color( r, g, b, 1))

