extends Node2D

class_name TowerScene

var moneyAmount
var currencyNode

var buttons = Dictionary()
var towers = Dictionary()
var numTowers
var button
var tower
var base_locations = {0 : [150, 400], 1 : [405, 400], 2 : [660, 400], 3 : [915, 400]}
var towerCost
var buttonsShown
var time

signal towerBuilt

# Called when the node enters the scene tree for the first time.
func _ready():
	button = preload("res://button_build.tscn")
	tower = preload("res://building.tscn")
	currencyNode = get_node("CurrencyBackground/Currency")
	buttonsShown = true
	
	time = 0
	numTowers = 0
	towerCost = currencyNode.towerCost
	moneyAmount = currencyNode.moneyAmount
	
	for index in base_locations:
		buttons[index] = button.instantiate()
		add_child(buttons[index])
		buttons[index].buttonIndex = index
		buttons[index].buildButtonPressed.connect(buildTower)
		buttons[index].position = Vector2(base_locations[index][0], base_locations[index][1])

func buildTower(index):
	if moneyAmount >= towerCost:
		towers[index] = tower.instantiate()
		towers[index].position.x = buttons[index].position.x
		towers[index].position.y = buttons[index].position.y + 16
		buttons[index].position.y -= 64
		add_child(towers[index])
		towers[index].towerIndex = numTowers
		numTowers += 1
		
		towerBuilt.emit()


func _on_currency_money_updated():
	moneyAmount = currencyNode.moneyAmount
	if moneyAmount < towerCost and buttonsShown:
		buttonsShown = false
		for key in buttons:
			if buttons[key] != null:
				buttons[key].visible = false
	elif moneyAmount >= towerCost and not buttonsShown:
		buttonsShown = true
		for key in buttons:
			if buttons[key] != null:
				buttons[key].visible = true
