extends Label

@export var state_machine : ActorStateMachine 

func _process(_delta):
	text = "State : " + state_machine.current_state.name
