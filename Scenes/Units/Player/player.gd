extends CharacterBody2D

@export_category("Mining")
@export var mining_distance := 80
@export var minecast_interval := .5

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mine"):
		$MineCast.enabled = true
		$MineCast.target_position = Vector2(mining_distance, 0)
		
		var num_rotations = 360 / minecast_interval
		while num_rotations != 0:
			$MineCast.force_raycast_update()
			if Global.curr_tile and $MineCast.get_collider() == Global.curr_tile:
				Global.curr_tile.get_node("Breakable").break_progress += .1
				break
			$MineCast.target_position = $MineCast.target_position.rotated(minecast_interval)
			num_rotations -= 1
	else:
		$MineCast.enabled = false
