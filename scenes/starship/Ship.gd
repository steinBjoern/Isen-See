extends Mover

# attributes
var at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}


func _ready():
	print( 'hello ship ', self.name)
	


func _integrate_forces( state):
	fly( state)
	steer()
	


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
