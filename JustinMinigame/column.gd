extends Button

@export var columnVal: int
@export var playerPieceScene : PackedScene
#signal columnSelected(columnNum)

var board

# Called when the node enters the scene tree for the first time.
func _ready():
	board = get_node("/root/Board")

	pass # Replace with function body.

func spawnPiece():
	var newPiece = playerPieceScene.instantiate()
	newPiece.position = $dropLocation.position
	newPiece.assignColor(board.currentPlayer)
	add_child(newPiece)
	
func _on_pressed():
	if board.hasSpace(columnVal):
		spawnPiece()
	board.addPiece(columnVal)
	


