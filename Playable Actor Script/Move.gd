class_name Move

extends State

@export var idle_state : State
@export var jump_state : State
@export var fall_state : State
@export var dash_cooldown : float = 0.5

var movement : Vector2
var dash_cooldown_counter : float

func enter() -> void:
	actor.animations.play("run")
	actor.coyote_time_counter = actor.coyote_time
	move_speed = normal_speed

func physics_process(_delta: float) -> State:
	actor.velocity.y += gravity * _delta
	
	if not actor.dashing:
		movement = Input.get_vector("left", "right", "up", "down") 
	actor.velocity.x = movement.x * move_speed
	
	if not actor.dashing and Input.is_action_just_pressed("dash") and dash_cooldown_counter <= 0:
		actor.dashing = true
		move_speed = dash_speed
		actor.dash_timer.start(dash_length)
		actor.animations.play("dash")
		dash_cooldown_counter = dash_cooldown 
	
	dash_cooldown_counter -= _delta
	actor.move_and_slide()
	return null

func input_process(_event : InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and actor.coyote_time_counter > 0.0:
		return jump_state
	
	return null

func frame_process(_delta : float) -> State:
	if Input.is_action_pressed("left"):
		actor.animations.flip_h = true
	elif Input.is_action_pressed("right"):
		actor.animations.flip_h = false
	
	if movement.x == 0:
		return idle_state
	
	if !actor.is_on_floor():
		actor.coyote_time_counter -= _delta
		if actor.coyote_time_counter < 0.0:
			return fall_state
	
	return null

func _on_dash_timer_timeout():
	actor.dash_timer.stop()
	actor.animations.play("run")
	actor.dashing = false
	move_speed = normal_speed
