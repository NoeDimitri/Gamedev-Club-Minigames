extends Sprite2D

#class for a singular building and its components
class_name Building

#index of the building for storage purposes
@export var towerIndex: int

#what people are in 1 of 4 spots in the building
var members = Dictionary()

#time variable to track when money is made
var time = 0.0

#money holder for adding to money
var currencyNode

#variable to store a worker copy
var workerCopy = preload("res://button_pusher_worker.tscn")

func _ready():
	#on ready get the currency node for use in working with money
	currencyNode = get_node("/root/Node2D/CurrencyBackground/Currency")

	#list to keep track of what is in which spot of the building
	members[find_child("Spot1")] = null
	members[find_child("Spot2")] = null
	members[find_child("Spot3")] = null
	members[find_child("Spot4")] = null

#ensure that empty positions are properly displayed as empty
func updateIcons():
	for key in members:
		if members[key] == null:
			key.find_child("Sprite2D").set_texture(null)
