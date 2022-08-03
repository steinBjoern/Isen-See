extends AnimatedSprite

var target_scale : Vector2

func perform_attack( from : Vector2, to : Vector2):
	var length = get_viewport_rect().size.y
	var width = get_viewport_rect().size.x
	set_rotation( from.angle_to_point( to) - PI / 2)
	target_scale = Vector2( 1 * 190 / width, from.distance_to( to) * 2 / length)
	global_position = (from + to) / 2
	show()

func _process( delta):
	scale = lerp( scale, target_scale, 2)
	target_scale *= 1 - .1 * delta
