extends 'res://player/states/_state.gd'

var speed = 0
const MAX_SPEED = 600

var acceleration = 3500
var decceleration = 4000

var motion = Vector2()


func _input(event):
	if event.is_action_pressed('attack'):
		player.go_to_state(player.ATTACK)

func _fixed_process(delta):
    # Movement
	player.move_direction = Vector2()

	if Input.is_action_pressed("move_right"):
		player.move_direction.x = 1
	elif Input.is_action_pressed("move_left"):
		player.move_direction.x = -1
	elif Input.is_action_pressed("move_up"):
		player.move_direction.y = -1
	elif Input.is_action_pressed("move_down"):
		player.move_direction.y = 1

	if player.move_direction != Vector2():
		speed += acceleration * delta
		if player.look_direction != player.move_direction:
			player.look_direction = player.move_direction
			if player.move_direction.x == 1:
				player.AnimationPlayer.play("walk_right")
			if player.move_direction.x == -1:
				player.AnimationPlayer.play("walk_left")
			else:
				player.AnimationPlayer.play("walk_right")
	else:
		speed -= decceleration * delta

	speed = clamp(speed, 0, MAX_SPEED)

	# Motion
	motion = speed * player.move_direction.normalized() * delta
	var move_remainder = player.move(motion)

	if player.is_colliding():
		var n = player.get_collision_normal()
		player.move(n.slide(move_remainder))

	# State management
	if speed == 0 and player.move_direction == Vector2():
		player.go_to_state(player.IDLE)