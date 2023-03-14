extends Label

@export var moneyAmount: int
var towerCost

# Called when the node enters the scene tree for the first time.
func _ready():
	moneyAmount = 1000
	towerCost = 900
	
	self.text = str(moneyAmount) + " $"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateMoney():
	self.text = str(moneyAmount) + " $"

func _on_node_2d_tower_built():
	moneyAmount -= towerCost
	updateMoney()

