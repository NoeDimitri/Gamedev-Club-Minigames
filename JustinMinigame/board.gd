extends Node2D

var boardPieces = []
var boardHeight = []
var currentPlayer
var pieceDict = {
	1 : 1,
	-1: 2
}

@export var maxHeight: int = 6
@export var maxWidth: int = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	currentPlayer = 1
	for i in range(maxWidth):
		boardPieces.append([0,0,0,0,0,0])
		boardHeight.append(0)
	
	
func addPiece(columnNum):
	if boardHeight[columnNum-1] >= maxHeight:
		#print("too big!!")
		return
	boardPieces[columnNum-1][boardHeight[columnNum-1]] = pieceDict[currentPlayer]
	boardHeight[columnNum-1] += 1
	currentPlayer *= -1
	checkWin(columnNum)
	print(checkWin(columnNum))
	showBoard()

func showBoard():
	for row in boardPieces:
		print(row)
	print("---------")

func checkWin(columnChosen):
	var xCoord = columnChosen
	var yCoord = boardHeight[columnChosen-1]
	var playerNum = pieceDict[currentPlayer]
	#Horizontal Check
	#print(extendDirection(xCoord, yCoord, 1, 0, playerNum) + extendDirection(xCoord, yCoord, -1, 0, playerNum))
	if extendDirection(xCoord, yCoord, 1, 0, playerNum) + extendDirection(xCoord, yCoord, -1, 0, playerNum) >= 5:
		return true
	#Vertical Check
	if extendDirection(xCoord, yCoord, 0, 1, playerNum) + extendDirection(xCoord, yCoord, 0, -1, playerNum) >= 5:
		return true
	#top right Diagonal
	if extendDirection(xCoord, yCoord, 1, 1, playerNum) + extendDirection(xCoord, yCoord, -1, -1, playerNum) >= 5:
		return true
	#top left diagonal
	if extendDirection(xCoord, yCoord, -1, 1, playerNum) + extendDirection(xCoord, yCoord, 1, -1, playerNum) >= 5:
		return true
	return false
	
func extendDirection(xPos, yPos, xDelta, yDelta, playerNum):
	#print(xPos, " ", yPos)
	if not checkValidSpace(xPos, yPos) or boardPieces[xPos][yPos] != playerNum:
		return 0
	return 1 + extendDirection(xPos+xDelta, yPos + yDelta, xDelta, yDelta, playerNum)

func checkValidSpace(xCoord, yCoord):
	if(xCoord < 0 or xCoord >= maxWidth or yCoord < 0 or yCoord >= maxHeight):
		return false
	return true

