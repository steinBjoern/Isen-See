extends Node


func _process(delta):
	if get_parent().get_mv().has( 'goal'):
		var p = get_parent().get_global_position()
		var g = get_parent().get_mv().goal
		var v = get_parent().get_linear_velocity()
		update_closeline( p, g, v)
		update_tang_line( p, g, v)
		update_stop_line( p, g, v)
#	stop distance

func update_closeline( p, g, v):
	if $vclose.visible:
		var dg = p.direction_to( g)
		var vc = v.project( dg)
		$vclose.set_points( [ p, p + vc])
		
	


func update_tang_line( p, g, v):
	if $vtang.visible:
		var do = p.direction_to( g).rotated( PI / 2)
		var vo = v.project( do)
		$vtang.set_points( [ p, p + vo])
		
	


func update_stop_line( p, g, v):
	if $dstop.visible:
		$dstop.set_points( [ p, p + v.normalized() * get_parent().get_stop_distance()])
		
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
