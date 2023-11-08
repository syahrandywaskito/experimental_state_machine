class_name JumpState

extends State

@export var player : Player

signal player_move

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func state_enter():
	player.is_player_jump = true

func _physics_process(_delta):
	if player.is_on_floor() and player.is_player_jump:
		player.velocity.y = player.jump_force
		player.is_player_jump = false
	else:
		player_move.emit()
		
	player.move_and_slide()
#	print("Jump State : " + str(player.velocity.y))

