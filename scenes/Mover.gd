extends RigidBody2D
class_name Mover

# movement state
var c : Dictionary = {
	# velocity
	'force' : 9009.0,
	'angular_force' : 90000.0,
	'direction' : Vector2.ZERO, 
}


func _ready():
	print( 'hello Mover ', self.name)
	


func fly( state):
	if c[ 'direction'] != Vector2.ZERO:
		set_applied_force( c[ 'direction'] * c[ 'force'])
		
	elif c.has( 'point'):
		fly_to_point( c[ 'point'], state)
		
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
	f_close = stop_velocity( v_orbit)
#	else:
	f_orbit = close_distance( v_close, dir, state)
		
	force = ( f_close + f_orbit).normalized() * min(c.force, (f_close + f_orbit).length())
	set_applied_force( force)



func stop_velocity( velocity : Vector2):
	var delta = get_physics_process_delta_time()
	var force : Vector2
	var velocity_speed = velocity.length()
	
	if velocity_speed > c[ 'force'] / mass * delta:
		force = -velocity.normalized() * c[ 'force']
		
	elif velocity_speed > 0.01:
		force = -velocity.normalized() * velocity_speed * mass / delta
		
	else:
		force = Vector2.ZERO
	
#	set_applied_force( force)
	return force


func close_distance( v_close : Vector2, direction : Vector2, state : Physics2DDirectBodyState):
	var delta = get_physics_process_delta_time()
	var deceleration = c[ 'force'] / mass
	var stop_speed = get_stop_time() * deceleration
	var distance = global_position.distance_to( c[ 'point']) 
	var force : Vector2
	
	if distance > get_stop_distance():
		force = direction * c[ 'force']
		
	elif ( ( direction - v_close.normalized()).length() < 1 
	and v_close.length() > c[ 'force'] / mass * delta):
		force = -direction * c[ 'force']
		
	else:
		if distance > 7 :
			force = -linear_velocity * mass / delta
			
		else:
			state.linear_velocity = Vector2.ZERO
			c.erase( 'point')
			force = Vector2.ZERO
			
		
	return force
	


func steer():
	if c.has( 'point_angle'):
		var angle_to_go = wrapf( c[ 'point_angle'] - global_rotation, -PI, PI)
		
		if abs( angle_to_go) > get_stop_angle():
			set_applied_torque( c[ 'angular_force'] * sign( angle_to_go))
			
		else: 
			angular_stop( get_physics_process_delta_time())
			
		
	


func angular_stop( delta : float):
	var dir = sign( -angular_velocity)
	
	if c[ 'angular_force'] / inertia * delta < abs( angular_velocity):
		set_applied_torque( dir * c[ 'angular_force'])
	
	else:
		set_applied_torque( dir * angular_velocity * inertia / delta)
		
	


func get_stop_angle() -> float:
	var spin_force = angular_velocity * inertia
	var stop_time = spin_force / c[ 'angular_force']
	var stop_angle = abs( c[ 'angular_force'] / inertia / 2 * pow( stop_time, 2))
	
	return stop_angle


func get_stop_time() -> float:
	var deceleration : float = c[ 'force'] / mass
	var stop_time : float = linear_velocity.length() / deceleration
	return stop_time


func get_stop_distance() -> float :
	var stop_distance : float = abs( c[ 'force'] / mass / 2 * pow( get_stop_time(), 2))
	
	return stop_distance


func get_c() -> Dictionary:
	return c
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT

