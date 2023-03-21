extends Node2D

#The object for the gui and holder of the buildings and buttons.
class_name TowerScene

#money holder for buying buildings and towerCost from the money holder
var currencyNode
var towerCost

#track the buttons and buildings currently in the world
var buttons = Dictionary()
var towers = Dictionary()
var numTowers = 0

#preload assets to be placed
var button = preload("res://button_build.tscn")
var tower = preload("res://building.tscn")

#modifiable starting locations for the buttons in the form index : [x,y]
var base_locations = {0 : [150, 400], 1 : [405, 400], 2 : [660, 400], 3 : [915, 400]}

#buttons hide when buildings arent purchasable
var buttonsShown = true

#used to say that a building was successfully built
signal towerBuilt

# Called when the node enters the scene tree for the first time.
func _ready():
	#get the currency node to be used for tracking purchases when ready
	currencyNode = get_node("CurrencyBackground/Currency")
	
	#Get the tower cost from the currency node
	towerCost = currencyNode.towerCost
	
	#Places all of the buttons for buying buildings adjacent and in a list
	for index in base_locations:
		buttons[index] = button.instantiate()
		add_child(buttons[index])
		buttons[index].buttonIndex = index
		buttons[index].buildButtonPressed.connect(buildTower)
		buttons[index].position = Vector2(base_locations[index][0], base_locations[index][1])

#On pressing the purchase building button, creates a new building and adds it to the list
func buildTower(index):
	if currencyNode.moneyAmount >= towerCost:
		towers[index] = tower.instantiate()
		towers[index].position.x = buttons[index].position.x
		towers[index].position.y = buttons[index].position.y + 16
		buttons[index].position.y -= 64
		add_child(towers[index])
		towers[index].towerIndex = numTowers
		numTowers += 1
		
		#tell other nodes that a tower was successfully built
		towerBuilt.emit()

#Makes building buttons invisible if not purchasable
func _on_currency_money_updated():
	if currencyNode != null and currencyNode.moneyAmount < towerCost:
		if buttonsShown:
			buttonsShown = false
			for key in buttons:
				if buttons[key] != null:
					buttons[key].visible = false
	elif not buttonsShown:
		buttonsShown = true
		for key in buttons:
			if buttons[key] != null:
				buttons[key].visible = true
