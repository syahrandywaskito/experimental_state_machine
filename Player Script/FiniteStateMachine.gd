class_name FiniteStateMachine

extends Node

@export var state : State

func _ready():
	change_state(state)

func change_state(new_state : State) -> void:
	if state is State:
		state.state_exit()
	new_state.state_enter()
	state = new_state

func _physics_process(delta) -> void:
	state.physics_update(delta)
	
func _process(delta) -> void:
	state.update(delta)
	
func _input(event) -> void:
	state.input_handler(event)
