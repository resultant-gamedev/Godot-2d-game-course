extends 'res://player/states/_state.gd'

var input_direction = Vector2()

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
	input_direction = Vector2()

	if Input.is_action_pressed("move_right"):
		input_direction.x = 1
	elif Input.is_action_pressed("move_left"):
		input_direction.x = -1
	elif Input.is_action_pressed("move_up"):
		input_direction.y = -1
	elif Input.is_action_pressed("move_down"):
		input_direction.y = 1

	if input_direction != Vector2():
		speed += acceleration * delta
	else:
		speed -= decceleration * delta

	speed = clamp(speed, 0, MAX_SPEED)

	# Motion
	motion = speed * input_direction.normalized() * delta
	var move_remainder = player.move(motion)

	if player.is_colliding():
		var n = player.get_collision_normal()
		player.move(n.slide(move_remainder))

	# State management
	if speed == 0 and input_direction == Vector2():
		player.go_to_state(player.IDLE)