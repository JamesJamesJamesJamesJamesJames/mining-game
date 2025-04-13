extends Node2D

@export var x_inc := 16
@export var y_inc := 16

var tile1_path = preload("res://Scenes/Environment/Tiles/tile1.tscn")
var tile2_path = preload("res://Scenes/Environment/Tiles/tile2.tscn")
var tile3_path = preload("res://Scenes/Environment/Tiles/tile3.tscn")

var noise = FastNoiseLite.new()

func _ready() -> void:
	noise.seed = Global.rand_seed
	
	for x in range(100):
		for y in range(100):
			var noise_val = noise.get_noise_2d(x, y)
			var tile
			if noise_val < -.2:
				tile = tile1_path.instantiate()
			elif noise_val < .2:
				tile = tile2_path.instantiate()
			else:
				tile = tile3_path.instantiate()
			tile.position = Vector2(x * x_inc, y * y_inc)
			call_deferred("add_child", tile)
