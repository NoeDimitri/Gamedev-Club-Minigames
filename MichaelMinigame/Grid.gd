extends Node2D
# controls functions of the grid
# creates pieces, finds blank spaces, or moving pieces
# and deleting/combining pieces



var width := 4
var height := 4
var board := []
var x_start := 96
var y_start := 912
var offset := 128
# define pieces for the board
@export var piece_two: PackedScene
@export var piece_four: PackedScene
@export var background_piece: PackedScene
# @export var piece_eight: PackedScene
# @export var piece_sixteen: PackedScene
# @export var piece_thirtytwo: PackedScene
# @export var piece_64: PackedScene
# @export var piece_128: PackedScene
# @export var piece_256: PackedScene
# @export var piece_512: PackedScene
# @export var piece_1024: PackedScene
# @export var piece_2048: PackedScene
# @export var piece_4096: PackedScene
# @export var piece_8192: PackedScene
# @export var piece_16384: PackedScene
# @export var piece_32768: PackedScene
# @export var piece_65536: PackedScene

func make_2d_array():
	"""
	creates a 4 x 4 array of 0s
	"""
	var array = []
	for i in range(0, width):
		var row = []
		for j in range(0, height):
			row.append(0)
		array.append(row)

func grid_to_pixel(grid_position : Vector2 ):
	"""
	converts grid coordinates to pixel coordinates
	"""
	var new_x = x_start + offset * grid_position.x
	var new_y = y_start + offset * grid_position.y
	return Vector2(new_x, new_y)

func is_in_grid(grid_position: Vector2):
	"""
	checks if a grid position is in the grid
	"""
	if grid_position.x < 0 or grid_position.x >= width:
		return false
	if grid_position.y < 0 or grid_position.y >= height:
		return false
	return true

func is_blank_space():
	"""
	checks if there is a blank space in the grid
	"""
	for i in range(0, width):
		for j in range(0, height):
			if board[i][j] == 0:
				return true
	return false
func move_all_pieces(direction: Vector2):
	pass
	
func pixel_to_grid(pixel_position: Vector2):
	"""
	converts pixel coordinates to grid coordinates
	"""
	var new_x = round((pixel_position.x - x_start) / offset)
	var new_y = round((pixel_position.y - y_start) / offset)
	return Vector2(new_x, new_y)

# Called when the node enters the scene tree for the first time.
func _ready():
	board = make_2d_array()
	generate_background()









# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_control_move(direction: Vector2):
	# move the current pieces one space based on direction
	move_all_pieces(direction)

	pass # Replace with function body.


func _on_controller_control_move(direction: Vector2):
	move_all_pieces(direction)
	pass # Replace with function body.
	
func _on_keyboard_control_move(direction: Vector2):
	move_all_pieces(direction)
	pass # Replace with function body.

func generate_new_piece():
	if is_blank_space():
		pass 
	else:
		print("no more room")
	
func generate_background():
	for i in width:
		for j in height:
			var temp = background_piece.instance()
			add_child(temp)
			temp.position = grid_to_pixel(Vector2(i, j))
