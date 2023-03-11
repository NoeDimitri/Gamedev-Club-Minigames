extends Node2D

var boardPieces = []
var currentPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentPlayer = 1
	for i in range(7):
		boardPieces.append([])
	
	
func addPiece(columnNum):
	boardPieces[columnNum-1].append(currentPlayer)
	currentPlayer *= -1
	showBoard()

func showBoard():
	for row in boardPieces:
		print(row)
	print("---------")
