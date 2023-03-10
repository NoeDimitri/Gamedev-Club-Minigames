extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = preload("res://button_build.tscn")
	
	#var button1 = button.instantiate()
	#add_child(button1)
	
	var locations = {0 : [150, 400], 1 : [400, 400], 2 : [650, 400], 3 : [900, 400]}
	var buttons = []
	
	for index in locations:
		buttons.insert(index, button.instantiate())
		add_child(buttons[index])
		buttons[index].position = Vector2(locations[index][0], locations[index][1])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

