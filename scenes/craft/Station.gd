extends Mover

func _integrate_forces(state):
	var delta = get_physics_process_delta_time()
	if angular_velocity < PI:
		apply_torque_impulse( pow( PI, 9) / delta)
