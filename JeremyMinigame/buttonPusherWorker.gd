extends Area2D

#buttonPusher worker when bought
class_name buttonPusherWorker

#clock and currency nodes for tracking and updating
var clockNode
var currencyNode

#if the worker is active, then it can work and make money
var active
var workingTime = 0.0

#store the clock and currency nodes
func _ready():
	clockNode = get_node("/root/Node2D/ClockBackground/Clock")
	currencyNode = get_node("/root/Node2D/CurrencyBackground/Currency")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	workingTime += delta
	if workingTime > 1.0:
		workingTime -= 1.0
		currencyNode.changeMoney(1)
