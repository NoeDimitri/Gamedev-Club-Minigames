extends Area2D

var canDrag = false

signal placingAttempted

var copy
var carried

func _ready():
	copy = preload("res://button_pusher.tscn")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseMotion:
		if event.button_mask == 1 and event.pressure == 1.00:
			if carried == null:
				carried = copy.instantiate()
				print("goodbye")
				carried.global_position = get_global_mouse_position()
				carried.visible = true
				get_tree().root.add_child(carried)
