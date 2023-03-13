extends Node2D

var buttons = Dictionary()
var towers = Dictionary()
var numTowers
var button
var tower
var base_locations = {0 : [150, 400], 1 : [405, 400], 2 : [660, 400], 3 : [915, 400]}

# Called when the node enters the scene tree for the first time.
func _ready():
	button = preload("res://button_build.tscn")
	tower = preload("res://building.tscn")
	
	numTowers = 0
	
	for index in base_locations:
		buttons[index] = button.instantiate()
		add_child(buttons[index])
		buttons[index].buttonIndex = index
		buttons[index].buildButtonPressed.connect(buildTower)
		buttons[index].position = Vector2(base_locations[index][0], base_locations[index][1])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
	
func buildTower(index):
	towers[index] = tower.instantiate()
	towers[index].position.x = buttons[index].position.x
	towers[index].position.y = buttons[index].position.y + 15
	buttons[index].position.y -= 60
	add_child(towers[index])
	towers[index].towerIndex = numTowers
	numTowers += 1
	
	
	print(buttons[index].position)
	pass

