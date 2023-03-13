extends Button

@export var buttonIndex: int

signal buildButtonPressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	buildButtonPressed.emit(buttonIndex)
	pass # Replace with function body.
