extends Area2D

var canDrag = false

var buttonPusherSprite = preload("res://buttonPusher.png")

var initialPos

var readyToPlace

var dragging

signal placingAttempted

var detectionEnabled

var hypotheticalDest

var currencyNode

func _ready():
	initialPos = self.position
	readyToPlace = false
	dragging = false
	detectionEnabled = true
	currencyNode = get_node("/root/Node2D/CurrencyBackground/Currency")

func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		self.global_position = get_global_mouse_position()
	else:
		dragging = false
		if readyToPlace:
			placingAttempted.emit("buttonPusher")
			readyToPlace = false
		queue_free()

func _on_area_shape_exited(_area_rid, area, area_shape_index, _local_shape_index):
	if detectionEnabled:
		var other_shape_owner = area.shape_find_owner(area_shape_index)
		var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
		
		var grandparent = other_shape_node.find_parent("*").find_parent("building")
		if grandparent != null:
			if grandparent.members[other_shape_node.find_parent("*")] == null:
				self.visible = true
				readyToPlace = false
				other_shape_node.find_parent("*").find_child("Sprite2D").set_texture(null)
				hypotheticalDest = false


func _on_area_shape_entered(_area_rid, area, area_shape_index, _local_shape_index):
	if detectionEnabled:
		var other_shape_owner = area.shape_find_owner(area_shape_index)
		var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
		
		var grandparent = other_shape_node.find_parent("*").find_parent("building")
		if grandparent != null:
			if grandparent.members[other_shape_node.find_parent("*")] == null:
				readyToPlace = true
				self.visible = false
				other_shape_node.find_parent("*").find_child("Sprite2D").set_texture(buttonPusherSprite)
				hypotheticalDest = other_shape_node.find_parent("*")


func _on_placing_attempted(_name):
	detectionEnabled = false
	
	if currencyNode.moneyAmount >= 100:
		hypotheticalDest.find_parent("*").members[hypotheticalDest] = "buttonPusher"
		currencyNode.moneyAmount -= 100
