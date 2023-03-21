extends Label

#tracker of the game time from 0 for use in the clock
@export var gameTime = 0.0

#a day is 12 hours by 60 minutes where minutes increment by 6
var dayLength = 12 * 6
var dayActive = true

#start the clock at the correct time
func _ready():
	updateClock()

#update the local time, and the local clock when needed
func _process(delta):
	if dayActive:
		gameTime += delta
		
		if ceil(gameTime) != ceil(gameTime - delta):
			updateClock()

#clock formatted as xx:yy with hours from 1 to 12, and minutes from 00 to 50
func updateClock():
	var dayDuration = int(gameTime) % dayLength
	var hours = str(dayDuration / 6 + 1)
	var minutes = str(dayDuration % 6)
	if len(hours) == 1:
		hours = "0" + hours
	if len(minutes) == 1:
		minutes = minutes + "0"
	self.text = hours + ":" + minutes


