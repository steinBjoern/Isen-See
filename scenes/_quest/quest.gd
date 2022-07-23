extends Node
class_name Quest

var priority : Dictionary = {
}

export var jobs : Dictionary = {
	'coordinates' : PoolVector2Array([Vector2.ZERO]),
	'crafts' : [ null],
}

onready var game = get_tree().root.get_node( 'Game')

func _process(delta):
	if game.nr.player and game.nr.player.avatar and self != game.nr.player.avatar:
		var i : = 0
		for c in jobs.coordinates:
			if jobs.crafts[ i]:
				jobs.coordinates[ i] = jobs.crafts[ i].global_position
				
			
		jobs.crafts[ 0] = game.nr.player.avatar
		get_parent().mv[ 'goal'] = jobs[ 'coordinates'][ 0]
	
