extends CharacterBody2D

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mine"):
		$MiningCast.target_position = get_local_mouse_position()
		$MiningCast.enabled = true
		
		if $MiningCast.get_collider() == Global.curr_tile and Global.curr_tile:
			Global.curr_tile.get_node("Breakable").break_progress += .1
	else:
		$MiningCast.enabled = false
