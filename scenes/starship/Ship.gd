extends RigidBody2D

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

# movement state
var mv : Dictionary = {
	# velocity
	'force' : 900.0,
	'angular_force' : 9000.0,
	'direction' : Vector2.ZERO,
}

func _ready():
	print( 'hello ship')
	


func _input( event):
	control_force( event)
	


func _integrate_forces( state):
	set_applied_force( mv.direction * mv.force)
	if mv.has( 'goal'):
		steer_to_point( mv.goal, state)
		
	


func control_force( event : InputEvent):
	var actions = [ 'ui_up', 'ui_down', 'ui_left', 'ui_right']
	var directions = [ Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
	var i : = 0
	for a in actions:
		if event.is_action_pressed( a):
			mv.direction += directions[ i]
		if event. is_action_released( a):
			mv.direction -= directions[ i]
		i += 1
		
	


func steer_to_point( point : Vector2, state : Physics2DDirectBodyState):
	steer( point, state)


func steer( point : Vector2, state : Physics2DDirectBodyState):
	var pos : Vector2 = global_position
	var rot : float = global_rotation
	var end_rot : float = pos.angle_to( point)
	
	if abs(end_rot - rot) > PI / 360:
		var dr = wrapf(pos.angle_to_point( point) - global_rotation, -PI, PI)
		var spin_force = angular_velocity * inertia
		
		var stop_time = spin_force / mv.torque
		var stop_way = mv.torque / inertia * pow( stop_time, 2)
		
		if abs( dr) > stop_way:
			set_applied_torque( mv.torque * sign( dr))
		else:
			set_applied_torque( mv.torque * -sign( angular_velocity))
			
		
	


func move_to_point( point : Vector2, state : Physics2DDirectBodyState):
	pass
	


func get_mv() -> Dictionary:
	return mv



