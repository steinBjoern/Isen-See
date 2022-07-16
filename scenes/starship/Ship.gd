extends RigidBody2D

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

# movement state
var mv : Dictionary = {
	# velocity
	'force' : 9009.0,
	'angular_force' : 9000.0,
	'direction' : Vector2.ZERO, 
}


func _ready():
	print( 'hello ship ', self.name)
	


func _integrate_forces( state):
	fly( state)
	


func fly( state):
	if mv.direction != Vector2.ZERO:
		set_applied_force( mv.direction * mv.force)
		
	elif mv.has( 'goal'):
		fly_to_point( mv.goal, state)
		
	else:
		set_applied_force( Vector2.ZERO)
		set_applied_torque( 0)
		
	


func fly_to_point( point : Vector2, state : Physics2DDirectBodyState):
	var dir = global_position.direction_to( point)
	var v_close = linear_velocity.project( dir)
	var v_orbit = linear_velocity.project( dir.rotated( PI / 2))
	var force = Vector2.ZERO
	var f_close : Vector2
	var f_orbit : Vector2
	
#	if v_orbit.length() > .01:# and v_close.normalized() == dir:
	f_close = stop_orbit( v_orbit)
#	else:
	f_orbit = close_distance( v_close, dir, state)
		
	force = ( f_close + f_orbit).normalized() * min(mv.force, (f_close + f_orbit).length())
	set_applied_force( force)



func stop_orbit( v_orbit : Vector2):
	var delta = get_physics_process_delta_time()
	var force : Vector2
	var orbit_speed = v_orbit.length()
	
	print( 'steeeer')
	if orbit_speed > mv.force / mass * delta:
		force = -v_orbit.normalized() * mv.force
		
	elif orbit_speed > 0.01:
		force = -v_orbit.normalized() * orbit_speed * mass / delta
		
	else:
		force = Vector2.ZERO
	
#	set_applied_force( force)
	return force


func close_distance( v_close : Vector2, direction : Vector2, state : Physics2DDirectBodyState):
	var delta = get_physics_process_delta_time()
	var deceleration = mv.force / mass
	var stop_speed = get_stop_time() * deceleration
	var distance = global_position.distance_to( mv.goal) 
	var force : Vector2
	
	if distance > get_stop_distance():
		force = direction * mv.force
		print( 'brumm')
		
	elif ( ( direction - v_close.normalized()).length() < 1 
	and v_close.length() > mv.force / mass * delta):
		force = -direction * mv.force
		
	else:
		if distance > 7 :
			force = -linear_velocity * mass / delta
			
		else:
			state.linear_velocity = Vector2.ZERO
			mv.erase( 'goal')
			force = Vector2.ZERO
			
		
#	set_applied_force( force)
	return force
	

func get_stop_time() -> float:
	var deceleration : float = mv.force / mass
	var stop_time : float = linear_velocity.length() / deceleration
	return stop_time


func get_stop_distance() -> float :
	var stop_distance : float = abs( mv.force / mass / 2 * pow( get_stop_time(), 2))
	
	return stop_distance


func get_mv() -> Dictionary:
	return mv
	

#
#func fly_to_point2( point : Vector2, state : Physics2DDirectBodyState):
#	steer( point, state)
#	move_to_point( point, state)
#
#
#
#func steer( point : Vector2, state : Physics2DDirectBodyState):
#	var aimed_rotation : float = global_position.angle_to_point( point) + PI
#	var angle_to_go = wrapf( aimed_rotation - global_rotation, -PI, PI)
#
#	if abs( angle_to_go) > get_stop_angle():
#		set_applied_torque( mv.angular_force * sign( angle_to_go))
#
#	else: 
#		angular_stop( get_physics_process_delta_time())
#
#
#
#
#func move_to_point( point : Vector2, state : Physics2DDirectBodyState):
#	if  (global_position.distance_to( point) > get_stop_distance() ): # just look at it
##		and is_facing( mv.goal)):
#		set_applied_force( mv.force * global_position.direction_to( point))#transform.x.normalized())
#
#	else:
#		linear_stop( get_physics_process_delta_time())
#
#
#
#
#func linear_stop( delta : float):
#	var dir = -linear_velocity.normalized()
#
#	if mv.force / mass * delta < linear_velocity.length():
#		set_applied_force( dir * mv.force)
#
#	else:
#		set_applied_force( -linear_velocity * mass / delta)
#
#
#
#
#func angular_stop( delta : float):
#	var dir = sign( -angular_velocity)
#
#	if mv.angular_force / inertia * delta < abs( angular_velocity):
#		set_applied_torque( dir * mv.angular_force)
#
#	else:
#		set_applied_torque( dir * angular_velocity * inertia / delta)
#
#
#
#
#func full_stop():
#	var delta = get_physics_process_delta_time()
#	linear_stop( delta)
#	angular_stop( delta)
#
#
#
#func is_facing( target : Vector2) -> bool:
#	if abs( transform.x.angle_to( mv.goal - target)) < 1:
#		return true
#	return false
#
#
#
#func get_stop_angle() -> float:
#	var spin_force = angular_velocity * inertia
#	var stop_time = spin_force / mv.angular_force
#	var stop_angle = abs( mv.angular_force / inertia * pow( stop_time, 2))
#
#	var delta = get_physics_process_delta_time()
#	return stop_angle + mv.angular_force * delta / inertia
#
#

# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
