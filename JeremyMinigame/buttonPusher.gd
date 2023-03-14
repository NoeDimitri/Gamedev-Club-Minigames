extends Sprite2D

var can_grab = true
var grabbed_offset = Vector2()

func _ready():
	grabbed_offset = position

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
