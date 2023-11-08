class_name ActorStateMachine

extends Node

@export var starting_state : State

var current_state : State

func init(actor : PlayableActor) -> void:
	for child in get_children():
		child.actor = actor
		
	# initialized initial state
	change_state(starting_state)

func change_state(new_state : State) -> void:
	if current_state: 
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

func input_process(event : InputEvent) -> void:
	var new_state = current_state.input_process(event)
	if new_state:
		change_state(new_state)

func physics_process(delta : float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)

func frame_process(delta : float ) -> void:
	var new_state = current_state.frame_process(delta)
	if new_state:
		change_state(new_state)
