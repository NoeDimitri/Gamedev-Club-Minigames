extends Button

@export var columnVal: int
#signal columnSelected(columnNum)

var board

# Called when the node enters the scene tree for the first time.
func _ready():
	board = get_node("/root/Board")
	pass # Replace with function body.

func _on_pressed():
	board.addPiece(columnVal)
