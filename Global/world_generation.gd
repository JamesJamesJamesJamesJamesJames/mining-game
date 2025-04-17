extends Node

## Returns a loaded resource of a tile
func get_tile(y_level: int, noise_val: float) -> Resource:
	if y_level > -10:
		return _get_surface_tile(noise_val)
	return null

func _get_surface_tile(noise_val: float) -> Resource:
	if noise_val < -.2:
		return preload("res://Scenes/Environment/Tiles/tile1.tscn")
	elif noise_val < .2:
		return preload("res://Scenes/Environment/Tiles/tile2.tscn")
	else:
		return preload("res://Scenes/Environment/Tiles/tile3.tscn")
