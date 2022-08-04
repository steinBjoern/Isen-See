extends Area2D

var c : Dictionary = {
	'point' : null,
	'ready' : false,
}

onready var game = get_tree().root.get_node( 'Game')


func _process(delta):
	if c[ 'ready']:
		c[ 'point'] = game.nr.player.avatar
		aim( delta)
		
	


func aim( delta : float):
	if c[ 'point']:
		var angle = global_position.angle_to_point( c[ 'point'].global_position)
		var dir = sign( wrapf( $Weapon.global_rotation - angle, -PI, PI))
		$Weapon.rotate( dir * $Weapon.at[ 'turn_speed'] * delta)
	

