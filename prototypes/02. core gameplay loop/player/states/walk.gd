extends 'res://utils/state.gd'


var input_direction = Vector2()
var move_direction = Vector2()

var speed = 0
const MAX_SPEED = 600

var acceleration = 3500
var decceleration = 4000

var motion = Vector2()

func _input(event):
	pass

func _fixed_process(delta):
	# State management
	if speed == 0 and input_direction == Vector2():
		target.go_to_state(target.IDLE)

    # Movement
	input_direction = Vector2()

	input_direction.x = Input.is_action_pressed("move_right") - Input.is_action_pressed("move_left")
	input_direction.y = Input.is_action_pressed("move_down") - Input.is_action_pressed("move_up")

	if input_direction != Vector2():
		move_direction = input_direction
		speed += acceleration * delta
	else:
		speed -= decceleration * delta

	speed = clamp(speed, 0, MAX_SPEED)
	target.Text.set_text('Speed: %s' % round(speed))

	motion = speed * move_direction.normalized() * delta

	var move_remainder = target.move(motion)

	if target.is_colliding():
		var n = target.get_collision_normal()
		target.move(n.slide(move_remainder))
