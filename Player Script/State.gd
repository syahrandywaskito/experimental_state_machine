class_name State

extends Node

signal _state_finished

func state_enter():
	pass
	
func state_exit():
	pass
	
func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func input_handler(_event : InputEvent): # input handler return new state ?
	pass
