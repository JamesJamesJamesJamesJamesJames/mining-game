extends Node2D

@export var x_inc := 16
@export var y_inc := 16

var tile1_path = preload("res://Scenes/Environment/Tiles/tile1.tscn")
var tile2_path = preload("res://Scenes/Environment/Tiles/tile2.tscn")
var tile3_path = preload("res://Scenes/Environment/Tiles/tile3.tscn")

var noise = FastNoiseLite.new()

func _ready() -> void:
	noise.seed = Global.rand_seed
	
	for x in range(50):
		for y in range(2):
			var noise_val = noise.get_noise_2d(x, y)
			var tile
			if noise_val < -.2:
				tile = tile1_path.instantiate()
			elif noise_val < .2:
				tile = tile2_path.instantiate()
			else:
				tile = tile3_path.instantiate()
				
			tile.position = Vector2(x * x_inc, y * y_inc)
			tile.mouse_entered.connect(_on_mouse_entered_tile.bind(tile))
			tile.mouse_exited.connect(_on_mouse_exited_tile.bind(tile))
			call_deferred("add_child", tile)

func _on_mouse_entered_tile(tile) -> void:
	Global.curr_tile = tile

func _on_mouse_exited_tile(tile) -> void:
	if Global.curr_tile == tile:
		Global.curr_tile = null
