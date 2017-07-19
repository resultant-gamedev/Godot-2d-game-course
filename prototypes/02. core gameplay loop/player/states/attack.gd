extends 'res://player/states/_state.gd'

const DURATION = 0.3
var counter = 0.0

func _ready():
	pass

func enter():
	counter = DURATION

func _input(event):
	pass

func _fixed_process(delta):
	counter -= delta

	# TODO: replace with pushdown automata?
	if counter <= 0.0:
		if player.previous_state == player.States[player.WALK]:
			player.go_to_state(player.WALK)
		else:
			player.go_to_state(player.IDLE)