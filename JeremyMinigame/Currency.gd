extends Label

#list the prices of things, and the starting cash
@export var moneyAmount = 500
var towerCost = 400
var buttonPusherCost = 25

#signal to call when the money is updated
signal moneyUpdated

#start with the correct money amount listed
func _ready():
	updateMoney()

#format the money in the form "x $" where x is the money amount
func updateMoney():
	self.text = str(moneyAmount) + " $"
	
	#tell other objects that the money has been updated
	moneyUpdated.emit()

#increase or decrease money method
func changeMoney(amount):
	moneyAmount += amount
	updateMoney()

#signal that a building was built and update money accordingly
func _on_node_2d_tower_built():
	moneyAmount -= towerCost
	updateMoney()

