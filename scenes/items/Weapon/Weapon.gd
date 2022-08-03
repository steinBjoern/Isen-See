extends Itm
class_name Weapon

func _init():
	category = 'weapon'
	at[ 'output'] = at[ 'max_hp']
	at[ 'turn_speed'] = PI


func _ready():
	category = 'weapon'
	get_parent().c[ 'ready'] = true
	$RayCast.add_exception( get_node('../'))
	$RayCast.add_exception( get_node('../../'))

func _process(delta):
	attack()

func attack():
	if $RayCast.is_colliding() and $Cooldown.time_left == 0:
		var from = global_position
		var to = $RayCast.get_collider().global_position
		$AttackPool.get_attack().perform_attack( from, to)
		$Cooldown.start()

# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
