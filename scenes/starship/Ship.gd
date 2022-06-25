extends KinematicBody2D

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

# move and velocity state
var mv : Dictionary = {
	# velocity
	'speed' : 900.0,
	'direction' : Vector2.ZERO,
}

func _ready():
	print( 'hello ship')

func _input( event):
	control_velocity( event)
	

func _process( delta):
	move_and_slide( mv.speed * mv.direction.normalized())

func control_velocity( event : InputEvent):
	var actions = [ 'ui_up', 'ui_down', 'ui_left', 'ui_right']
	var directions = [ Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
	var i : = 0
	for a in actions:
		if event.is_action_pressed( a):
			mv.direction += directions[ i]
		if event. is_action_released( a):
			mv.direction -= directions[ i]
		i += 1
	
