extends Node2D

@export var player: CharacterBody2D
@export_category("Constants")
@export var SPEED := 200
@export var JUMP_VEL := 400
@export var GRAVITY_MOD := 1

@export_category("Settings")
@export var enable := true

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		player.velocity.x = -SPEED
	elif Input.is_action_pressed("move_right"):
		player.velocity.x = SPEED
	elif player.is_on_floor():
		player.velocity.x = move_toward(player.velocity.x, 0, 800 * delta)
	if !player.is_on_floor():
		player.velocity.y += GRAVITY * delta * GRAVITY_MOD
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = -JUMP_VEL
	else:
		player.velocity.y = 0
	if enable:
		player.move_and_slide()
