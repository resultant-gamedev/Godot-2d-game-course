extends AnimatedSprite

func change_direction(direction):
	var frame_number = 0
	
	if direction == Vector2(0, -1):
		frame_number = 0
	elif direction == Vector2(1, -1):
		frame_number = 1
	elif direction == Vector2(1, 0):
		frame_number = 2
	elif direction == Vector2(1, 1):
		frame_number = 3
	elif direction == Vector2(0, 1):
		frame_number = 4
	elif direction == Vector2(-1, 1):
		frame_number = 5
	elif direction == Vector2(-1, 0):
		frame_number = 6
	elif direction == Vector2(-1, -1):
		frame_number = 7
	
	set_frame(frame_number)