extends AnimatedSprite


func _process( _delta):
	var force : Vector2 = get_parent().get_applied_force()
	var power : float = force.length()
	var scale_force : float = get_parent().get_mv().force
	scale = lerp( scale, Vector2.ONE * min(power / scale_force, 2), .2)
	global_rotation = force.angle() + PI * 1.5
	speed_scale = lerp( speed_scale, min(power / scale_force / 10, 10), .1)


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
