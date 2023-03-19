extends Sprite2D

class_name Building

@export var towerIndex: int
var members
var time: float
var currencyNode

# Called when the node enters the scene tree for the first time.
func _ready():
	currencyNode = get_node("/root/Node2D/CurrencyBackground/Currency")
	members = Dictionary()

	members[find_child("Spot1")] = null
	members[find_child("Spot2")] = null
	members[find_child("Spot3")] = null
	members[find_child("Spot4")] = null
	time = 0.0
	
func _process(delta):
	time += delta
	if time >= 1.0:
		time -= 1.0
		secondPassed()

func secondPassed():
	for member in members:
		if members[member] == "buttonPusher":
			currencyNode.moneyAmount += 1
	currencyNode.updateMoney()

func updateIcons():
	for key in members:
		if members[key] == null:
			key.find_child("Sprite2D").set_texture(null)
