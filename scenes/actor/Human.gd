extends Mover

# attributes
var at : Dictionary = {
	'hitpoints' : 100.0,
	'max_hp' : 100.0,
}

func _ready():
	print( 'hello ', self)
	


func _integrate_forces(state):
	fly( state)
	


func _on_Touch_body_entered(body):
	if Input.is_action_pressed( 'loosen'):
		if body.has_method( 'get_mv') and body != self:
			body.add_to_group( 'avatar')
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
