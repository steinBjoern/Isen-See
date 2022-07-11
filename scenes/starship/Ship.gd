extends RigidBody2D

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

# movement state
var mv : Dictionary = {
	# velocity
	'force' : 9000.0,
	'angular_force' : 90000.0,
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
	steer( point, state)
	move_to_point( point, state)
	


func steer( point : Vector2, state : Physics2DDirectBodyState):
	var aimed_rotation : float = global_position.angle_to_point( point) + PI
	var angle_to_go = wrapf( aimed_rotation - global_rotation, -PI, PI)
	
	if abs( angle_to_go) > get_stop_angle():
		set_applied_torque( mv.angular_force * sign( angle_to_go))
		
	else: 
		angular_stop( get_physics_process_delta_time())
		
	


func move_to_point( point : Vector2, state : Physics2DDirectBodyState):
	if  (global_position.distance_to( point) > get_stop_distance() # just look at it
		and is_facing( mv.goal)):
		set_applied_force( mv.force * transform.x.normalized())
		
	else:
		linear_stop( get_physics_process_delta_time())
		
	


func linear_stop( delta : float):
	var dir = -linear_velocity.normalized()
	
	if mv.force / mass * delta < linear_velocity.length():
		set_applied_force( dir * mv.force)
		
	else:
		set_applied_force( -linear_velocity * mass / delta)
		
	


func angular_stop( delta : float):
	var dir = sign( -angular_velocity)
	
	if mv.angular_force / inertia * delta < abs( angular_velocity):
		set_applied_torque( dir * mv.angular_force)
		
	else:
		set_applied_torque( dir * angular_velocity * inertia / delta)
		
	


func full_stop():
	var delta = get_physics_process_delta_time()
	linear_stop( delta)
	angular_stop( delta)
	


func is_facing( target : Vector2) -> bool:
	if abs( transform.x.angle_to( mv.goal - global_position)) < 1:
		return true
	return false


func get_stop_distance() -> float :
	var deceleration : float = mv.force / mass
	var stop_time : float = linear_velocity.length() / deceleration
	var stop_distance : float = abs( mv.force / mass * pow( stop_time * PI, 2))
	var delta = get_physics_process_delta_time()
	return stop_distance# + mv.force * delta / mass


func get_stop_angle() -> float:
	var spin_force = angular_velocity * inertia
	var stop_time = spin_force / mv.angular_force
	var stop_angle = abs( mv.angular_force / inertia * pow( stop_time, 2))
	
	var delta = get_physics_process_delta_time()
	return stop_angle + mv.angular_force * delta / inertia
	


func get_mv() -> Dictionary:
	return mv
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
