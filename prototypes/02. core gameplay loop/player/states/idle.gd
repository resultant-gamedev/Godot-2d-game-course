extends 'res://utils/state.gd'

func _ready():
	pass


func _input(event):
	if event.is_action_pressed('attack'):
		target.go_to_state(target.ATTACK)


func _fixed_process(delta):
	var move_direction = Vector2()
	move_direction.x = Input.is_action_pressed("move_left") - Input.is_action_pressed("move_right")
	move_direction.y = Input.is_action_pressed("move_down") - Input.is_action_pressed("move_up")

	if move_direction != Vector2():
		target.go_to_state(target.WALK)