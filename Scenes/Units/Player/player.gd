extends CharacterBody2D

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mine"):
		$MiningCast.target_position = get_local_mouse_position()
		$MiningCast.enabled = true
	else:
		$MiningCast.enabled = false
