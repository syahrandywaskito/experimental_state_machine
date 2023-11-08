class_name MoveState

extends State

signal player_jump

@export var player : Player

func state_enter():
	player.is_player_move = true 

func input_handler(_event : InputEvent) -> void:
	player.direction = Input.get_axis("left", "right")
	player.is_player_jump = Input.is_action_just_pressed("jump") and player.is_on_floor()

func physics_update(_delta : float) -> void:
	if player.direction != 0 and player.is_player_move:
		player.velocity.x = player.direction * player.speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)

	if player.is_player_jump:
		player_jump.emit()
		
	player.move_and_slide()
#	print("Move State : " + str(player.velocity.x))
#	print("Player Direction : " + str(player.direction))
	
