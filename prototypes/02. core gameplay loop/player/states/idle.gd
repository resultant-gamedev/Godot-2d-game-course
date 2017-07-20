extends 'res://player/states/_state.gd'

func _ready():
	pass

func enter():
	if player.look_direction.x == 1:
		player.AnimationPlayer.play("idle_right")
	if player.look_direction.x == -1:
		player.AnimationPlayer.play("idle_left")
	else:
		player.AnimationPlayer.play("idle_right")

func _input(event):
	if event.is_action_pressed('attack'):
		player.go_to_state(player.ATTACK)


func _fixed_process(delta):
	var input_direction = Vector2()
	
	if Input.is_action_pressed("move_right"):
		input_direction.x = 1
	elif Input.is_action_pressed("move_left"):
		input_direction.x = -1
	elif Input.is_action_pressed("move_up"):
		input_direction.y = -1
	elif Input.is_action_pressed("move_down"):
		input_direction.y = 1

	if input_direction != Vector2():
		player.go_to_state(player.WALK)