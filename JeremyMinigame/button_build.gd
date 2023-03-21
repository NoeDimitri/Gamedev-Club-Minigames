extends Button

#button used for purchasing buildings
class_name BuyButton

#index of the button
@export var buttonIndex: int

#signal used when the button is pressed
signal buildButtonPressed

#attempts a purchase of a building
func _on_pressed():
	buildButtonPressed.emit(buttonIndex)
