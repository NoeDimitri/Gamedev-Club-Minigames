extends Label

@export var moneyAmount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.text = str(1000) + " $"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
