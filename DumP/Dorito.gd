extends CanvasModulate

onready var r = rand_range( .1, 1.0)
onready var g = rand_range( .1, 1.0)
onready var b = rand_range( .1, 1.0)
#onready var a = rand_range( .1, 1.0)

var s = .2

func _ready():
	set_color(Color( r, g, b, 1))

func _process( delta):
	if randf() < .5:
		r = clamp(r + rand_range( -s, s) * delta, .0, 1.0)
		g = clamp(g + rand_range( -s, s) * delta, .0, 1.0)
		b = clamp(b + rand_range( -s, s) * delta, .0, 1.0)
		#	a = clamp(r + rand_range( -s, s) * delta, .33, 1.0)
	#	s = clamp(r + rand_range( -s, s) * delta, .1, 1.0)
		set_color(Color( r, g, b, 1))


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
