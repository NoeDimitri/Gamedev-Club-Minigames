extends Sprite2D

@export var towerIndex: int
var members

# Called when the node enters the scene tree for the first time.
func _ready():
	members = Dictionary()
	find_child("Spot1")
	members[find_child("Spot1")] = null
	members[find_child("Spot2")] = null
	members[find_child("Spot3")] = null
	members[find_child("Spot4")] = null
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
