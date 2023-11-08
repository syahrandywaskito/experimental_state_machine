class_name Fall

extends State

@export var idle_state : State
@export var move_state : State

var movement : Vector2

func enter() -> void:
	actor.animations.play("fall")
	move_speed = normal_speed

func physics_process(_delta : float) -> State:
	if !actor.is_on_floor():
		actor.velocity.y += gravity * _delta
	
	movement = Input.get_vector("left", "right", "up", "down") * move_speed
	actor.velocity.x = movement.x
	
	actor.move_and_slide()
	
	return null

func frame_process(_delta : float) -> State:
	if Input.is_action_pressed("left"):
		actor.animations.flip_h = true
	elif Input.is_action_pressed("right"):
		actor.animations.flip_h = false
	
	if actor.is_on_floor():
		if movement.x != 0:
			return move_state
		return idle_state
	
	return null
