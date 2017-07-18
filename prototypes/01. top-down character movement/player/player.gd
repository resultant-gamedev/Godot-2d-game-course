extends KinematicBody2D

onready var Text = get_node("Label")
onready var Anim = get_node("AnimatedSprite")

var input_direction = Vector2()
var move_direction = Vector2()

var speed = 0
const MAX_SPEED = 600

var acceleration = 3500
var decceleration = 4000

var motion = Vector2()

func _ready():
	set_as_toplevel(true)
	set_fixed_process(true)


func _fixed_process(delta):
	input_direction = Vector2()

	input_direction.x = Input.is_action_pressed("move_right") - Input.is_action_pressed("move_left")
	input_direction.y = Input.is_action_pressed("move_down") - Input.is_action_pressed("move_up")
	
	if input_direction != Vector2():
		move_direction = input_direction
		Anim.change_direction(move_direction)
		speed += acceleration * delta
	else:
		speed -= decceleration * delta

	speed = clamp(speed, 0, MAX_SPEED)
	Text.set_text('Speed: %s' % round(speed))

	motion = speed * move_direction.normalized() * delta

	move(motion)
