class_name Dash

extends State

@export var idle_state : State
@export var move_state : State
@export var fall_state : State

@export var dash_speed : float = 300
@export var dash_length : float = 2.0
@export var dash_timer : float = 0

func enter():
	actor.animations.play("dash")
	actor.is_dashing = true

func physics_process(_delta : float) -> State:
	actor.velocity.y += gravity * _delta
	
	if actor.is_dashing:
		dash_timer -= _delta
		if dash_timer <= 0:
			actor.is_dashing = false
			if actor.is_dashing == false:
				if !actor.is_on_floor():
					return fall_state
				if actor.is_on_floor():
					if actor.velocity.x == 0 : 
						return idle_state
					return move_state
	
	return null

func frame_process(_delta : float) -> State:
	
	return null


