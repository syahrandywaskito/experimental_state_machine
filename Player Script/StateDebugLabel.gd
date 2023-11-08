extends Label

@export var fsm : FiniteStateMachine

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "State : " + fsm.state.name
