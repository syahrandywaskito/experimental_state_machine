class_name PlayableActor

extends CharacterBody2D

@onready var actor_state_machine = $ActorStateMachine as ActorStateMachine
@onready var animations = $Animations as AnimatedSprite2D
@onready var dash_timer = $DashTimer as Timer

@export var coyote_time : float = 0.15
@export var coyote_time_counter : float

@export var dashing : bool = false


func _ready():
	# init this class (PlayableActor) to state machine
	actor_state_machine.init(self)

func _unhandled_input(event) -> void:
	actor_state_machine.input_process(event)

func _physics_process(delta) -> void:
	actor_state_machine.physics_process(delta)

func _process(delta):
	actor_state_machine.frame_process(delta)

