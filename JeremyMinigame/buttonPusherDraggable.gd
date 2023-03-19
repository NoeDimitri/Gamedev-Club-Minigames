extends Area2D

class_name ButtonPusherDraggable

var canDrag = false

signal placingAttempted

var copy
var carried

func _ready():
	copy = preload("res://buttonPusherCopy.tscn")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseMotion:
		if event.button_mask == 1 and event.pressure == 1.00:
			if carried == null:
				carried = copy.instantiate()
				carried.global_position = get_global_mouse_position()
				carried.visible = true
				get_node("/root/Node2D").add_child(carried)
