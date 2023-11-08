class_name State

extends Node

@export var normal_speed : float = 200.0
@export var dash_speed : float = 1000
@export var dash_length : float = 0.1

var move_speed : float
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var actor : PlayableActor

func exit() -> void:
	pass
	
func enter() -> void:
	pass

func physics_process(_delta : float) -> State:
	return null

func input_process(_event : InputEvent) -> State:
	return null

func frame_process(_delta: float) -> State:
	return null
