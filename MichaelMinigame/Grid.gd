extends Node2D
# controls functions of the grid
# creates pieces, finds blank spaces, or moving pieces
# and deleting/combining pieces

# each image is named its number + Tile + .png
var tiles = [
	"res://assets/tiles/2 Tile.png",
	"res://assets/tiles/4 Tile.png",
	"res://assets/tiles/8 Tile.png",
	"res://assets/tiles/16 Tile.png",
	"res://assets/tiles/32 Tile.png",
	"res://assets/tiles/64 Tile.png",
	"res://assets/tiles/128 Tile.png",
	"res://assets/tiles/256 Tile.png",
	"res://assets/tiles/512 Tile.png",
	"res://assets/tiles/1024 Tile.png",
	"res://assets/tiles/2048 Tile.png",
	"res://assets/tiles/4096 Tile.png",
	"res://assets/tiles/8192 Tile.png",
	"res://assets/tiles/16384 Tile.png",
	"res://assets/tiles/32768 Tile.png",
	"res://assets/tiles/65536 Tile.png",
	
]

var tiles_to_name_dict = {
	"res://assets/tiles/2 Tile.png": "2",
	"res://assets/tiles/4 Tile.png": "4",
	"res://assets/tiles/8 Tile.png": "8",
	"res://assets/tiles/16 Tile.png": "16",
	"res://assets/tiles/32 Tile.png": "32",
	"res://assets/tiles/64 Tile.png": "64",
	"res://assets/tiles/128 Tile.png": "128",
	"res://assets/tiles/256 Tile.png": "256",
	"res://assets/tiles/512 Tile.png": "512",
	"res://assets/tiles/1024 Tile.png": "1024",
	"res://assets/tiles/2048 Tile.png": "2048",
	"res://assets/tiles/4096 Tile.png": "4096",
	"res://assets/tiles/8192 Tile.png": "8192",
	"res://assets/tiles/16384 Tile.png": "16384",
	"res://assets/tiles/32768 Tile.png": "32768",
	"res://assets/tiles/65536 Tile.png": "65536",
}
var width := 4
var height := 4
var board := []
var x_start := 96
var y_start := 796
var offset := 128
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
	# create a scene for each tile
	for i in range(0, tiles.size()):
		var tile = load(tiles[i])
		var tile_scene = tile.instance()
		add_child(tile_scene)
		tile_scene.hide()
		# for the name of the scene use the dict 
		tile_scene.name = tiles_to_name_dict[tiles[i]]





	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_touch_control_move(direction: Vector2):
	# move the current pieces one space based on direction


	pass # Replace with function body.


func _on_controller_control_move(direction: Vector2):
	pass # Replace with function body.
	
func _on_keyboard_control_move(direction: Vector2):
	pass # Replace with function body.
