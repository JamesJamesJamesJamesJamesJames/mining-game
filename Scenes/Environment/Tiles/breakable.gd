extends Node

@export var breakable: Node2D
@export var max_break := 10
var break_progress = 0

func _physics_process(delta: float) -> void:
	if break_progress >= max_break:
		breakable.call_deferred("queue_free")
		
		# Test code to visualize breaking
		var shade = remap(break_progress, 0, 10, 1, 0)
		breakable.modulate = Color(shade, shade, shade)
		
		#break_progress += .1
