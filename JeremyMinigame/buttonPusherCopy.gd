extends Area2D

#class is the character from the character list while being dragged. Can be broadened
class_name ButtonPusherCopy


var buttonPusherSprite = preload("res://buttonPusher.png")
var workerCopy = preload("res://button_pusher_worker.tscn")
var readyToPlace = false
var dragging = false

signal placingAttempted

var detectionEnabled = true
var hypotheticalDest
var currencyNode

func _ready():
	currencyNode = get_node("/root/Node2D/CurrencyBackground/Currency")

func _process(_delta):
	#when the character is dropped, if its nowhere, delete it, otherwise attempt to place it in a building
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		self.global_position = get_global_mouse_position()
	else:
		dragging = false
		if readyToPlace:
			placingAttempted.emit("buttonPusher")
			readyToPlace = false
		queue_free()

#when it interacts with a potentially placeable spot on a building, snap to it
func _on_area_shape_exited(_area_rid, area, area_shape_index, _local_shape_index):
	if detectionEnabled:
		var other_shape_owner = area.shape_find_owner(area_shape_index)
		var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
		
		var grandparent = other_shape_node.find_parent("*").find_parent("*")
		if grandparent is Building:
			if grandparent.members[other_shape_node.find_parent("*")] == null:
				self.visible = true
				readyToPlace = false
				other_shape_node.find_parent("*").find_child("Sprite2D").set_texture(null)
				hypotheticalDest = false

#when it interacts with a potentially placeable spot on a building, snap to it
func _on_area_shape_entered(_area_rid, area, area_shape_index, _local_shape_index):
	if detectionEnabled:
		var other_shape_owner = area.shape_find_owner(area_shape_index)
		var other_shape_node = area.shape_owner_get_owner(other_shape_owner)
		
		var grandparent = other_shape_node.find_parent("*").find_parent("*")
		if grandparent is Building:
			if grandparent.members[other_shape_node.find_parent("*")] == null:
				readyToPlace = true
				self.visible = false
				other_shape_node.find_parent("*").find_child("Sprite2D").set_texture(buttonPusherSprite)
				hypotheticalDest = other_shape_node.find_parent("*")

#when a character is let go on a building, attempt to place it in the building
func _on_placing_attempted(_name):
	detectionEnabled = false
	
	#check to make sure there is enough money
	if currencyNode.moneyAmount >= currencyNode.buttonPusherCost:
		hypotheticalDest.find_parent("*").members[hypotheticalDest] = workerCopy.instantiate()
		hypotheticalDest.add_child(hypotheticalDest.find_parent("*").members[hypotheticalDest])
		currencyNode.changeMoney(0 - currencyNode.buttonPusherCost)
		hypotheticalDest.find_child("Sprite2D").visible = false
		
		
		
	#remove the icon from the building if it is null
	hypotheticalDest.find_parent("*").updateIcons()
