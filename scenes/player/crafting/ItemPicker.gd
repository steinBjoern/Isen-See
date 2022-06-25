extends Area2D

var focused : = false
var selected : = false
var offset : = Vector2.ZERO


func _ready():
	print( 'hello ItemPicker')
	connect_mouse()
	

func _input( event):
	select( event)
	deselect( event)
	

func _process( delta):
	drag()
	

func _on_ItemPicker_mouse_entered():
	focused = true
	

func _on_ItemPicker_mouse_exited():
	focused = false
	


func select( event):
	if focused and event.is_action_pressed( 'point_select'):
		selected = true
		offset = global_position - get_global_mouse_position() 
	


func deselect( event):
	if event.is_action_released( 'point_select'):
		selected = false
		for b in get_overlapping_bodies():
			if b.is_in_group( 'workpiece'):
				attach_item_to( b)
				return


func drag():
	if selected:
		global_position = get_global_mouse_position() + offset
		


func connect_mouse():
	print( 'connect mouse with item picker')
	connect( 'mouse_entered', self, '_on_ItemPicker_mouse_entered')
	connect( 'mouse_exited', self, '_on_ItemPicker_mouse_exited')
	

func attach_item_to( new_parent : Node):
	var hull = get_node( 'Hull') # this will brake when hull removable from ship
	var offs = hull.global_position - new_parent.global_position
	remove_child( hull)
	new_parent.add_child( hull)
	hull.set_position( offs)
	pass


# Copyright © 2022 Björn Moritz Sawatzky | License: MIT
