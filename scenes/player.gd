extends CharacterBody2D

@export var GRAVITY := 500

@export var speed = 200
@export var jump_vel = -600

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif is_on_floor():
		 #you have said the actual truth. 
		#print(velocity.x)
		velocity.x = move_toward(velocity.x, 0, 800*delta)
	if !is_on_floor():
		velocity.y += GRAVITY*delta
	elif Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_vel
	else:
		velocity.y = 0
	#print(velocity)
	move_and_slide()
