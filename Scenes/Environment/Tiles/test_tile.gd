extends StaticBody2D

var max_break: float = 10
# Breaks block when this hits 0
var break_progress: float = 0

func _physics_process(delta: float) -> void:
	if break_progress >= max_break:
		call_deferred("queue_free")
	
	# Test code to visualize breaking
	var shade = remap(break_progress, 0, 10, 1, 0)
	modulate = Color(shade, shade, shade)
	
	#break_progress += .1
