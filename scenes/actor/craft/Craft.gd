extends Mover

# attributes
const default_at : Dictionary = {
	'hitpoints' : .0,
	'max_hp' : .0,
}

var at : Dictionary = default_at

func _ready():
	add_to_group( 'avatar')
	print( 'hello ship ', self.name)
	


func _integrate_forces( state):
	fly( state)
	steer()
	


func integrate_parts():
	at = default_at
	for c in get_children():
		if c.has_method( 'get_at'):
			at[ 'hitpoints'] += c.get_at()[ 'hitpoints']
			at[ 'max_hp'] += c.get_at()[ 'max_hp']
			
		
	print( at)


func change_hp( amount : float):
	at[ 'hitpoints'] = clamp( at[ 'hitpoints'] + amount, 0, at[ 'max_hp'])

# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
