extends Label

@export var moneyAmount: int
var towerCost

signal moneyUpdated

# Called when the node enters the scene tree for the first time.
func _ready():
	moneyAmount = 500
	towerCost = 400
	
	self.text = str(moneyAmount) + " $"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func updateMoney():
	self.text = str(moneyAmount) + " $"
	moneyUpdated.emit()

func _on_node_2d_tower_built():
	moneyAmount -= towerCost
	updateMoney()
