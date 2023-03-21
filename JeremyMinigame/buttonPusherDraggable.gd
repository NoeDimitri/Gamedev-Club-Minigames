extends Area2D

#class is the character from the character list gui. Can be broadened
class_name ButtonPusherDraggable

#copy of the character preloaded, and the variable to store the carried character when clicked
var copy = preload("res://buttonPusherCopy.tscn")
var carried

#detect click and create draggable sprite
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_mask == 1:
			if carried == null:
				carried = copy.instantiate()
				carried.global_position = get_global_mouse_position()
				carried.visible = true
				get_node("/root/Node2D").add_child(carried)
