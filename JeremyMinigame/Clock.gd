extends Label

@export var gameTime: float
var dayLength
var dayActive

# Called when the node enters the scene tree for the first time.
func _ready():

	gameTime = 0
	dayActive = true
	dayLength = 12 * 6
	updateClock()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dayActive:
		gameTime += delta
		
		if ceil(gameTime) != ceil(gameTime - delta):
			updateClock()
	

func updateClock():
	var dayDuration = int(gameTime) % dayLength
	var hours = str(dayDuration / 6 + 1)
	var minutes = str(dayDuration % 6)
	if len(hours) == 1:
		hours = "0" + hours
	if len(minutes) == 1:
		minutes = minutes + "0"
	self.text = hours + ":" + minutes


