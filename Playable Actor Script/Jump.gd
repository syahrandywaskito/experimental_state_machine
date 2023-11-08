class_name Jump

extends State

@export var idle_state : State
@export var move_state : State
@export var fall_state : State

@export var jump_force : float = -500.0

var movement : Vector2

func enter() -> void:
	super()
	actor.velocity.y = jump_force
	actor.animations.play("jump")
	move_speed = normal_speed

func physics_process(_delta : float) -> State:
	actor.velocity.y += gravity * _delta
	
	if not actor.dashing:
		movement = Input.get_vector("left", "right", "up", "down") 
	actor.velocity.x = movement.x * move_speed
	
	if not actor.dashing and Input.is_action_just_pressed("dash") and movement != Vector2.ZERO:
		actor.dashing = true
		move_speed = dash_speed
		actor.dash_timer.start(dash_length)
		actor.animations.play("dash")
	
	actor.coyote_time_counter -= _delta
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
	
	if actor.velocity.y > 0 and !actor.is_on_floor() and actor.dashing == false: 
		return fall_state

	return null
	
func _on_dash_timer_timeout():
	actor.dash_timer.stop()
	actor.dashing = false
	move_speed = normal_speed
