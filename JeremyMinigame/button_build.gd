extends Button

class_name BuyButton

@export var buttonIndex: int

signal buildButtonPressed

func _on_pressed():
	buildButtonPressed.emit(buttonIndex)
