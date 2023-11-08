class_name  Idle

extends State

@export var move_state : State
@export var jump_state : State
@export var fall_state : State

func enter() -> void:
	super()
	actor.animations.play("idle")
	actor.velocity.x = 0
	actor.coyote_time_counter = actor.coyote_time

func input_process(_event : InputEvent) -> State:
	if _event.is_action_pressed("jump") and actor.coyote_time_counter > 0.0:
		return jump_state
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return move_state
	
	return null

func physics_process(_delta: float) -> State:
	actor.velocity.y += gravity * _delta

	actor.move_and_slide()
		
	return null

func frame_process(_delta : float) -> State:
	if Input.is_action_pressed("left"):
		actor.animations.flip_h = true
	elif Input.is_action_pressed("right"):
		actor.animations.flip_h = false
	
	if !actor.is_on_floor():
		return fall_state
	
	return null
	
