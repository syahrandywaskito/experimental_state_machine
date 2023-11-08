class_name Player

extends CharacterBody2D

@export var direction : float
@export var jump_force : float = -200
@export var double_jump_force : float = 0.9
@export var speed : float = 200
@export var is_player_jump : bool = false
@export var is_player_move : bool = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#@onready var state_machine = $StateMachine as FiniteStateMachine
#@onready var move_state = $StateMachine/MoveState as MoveState
#@onready var jump_state = $StateMachine/JumpState as JumpState


func _ready():
#	move_state.player_jump.connect(fsm.change_state.bind(jump_state))
#	jump_state.player_move.connect(fsm.change_state.bind(move_state))
	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	
	move_and_slide()
