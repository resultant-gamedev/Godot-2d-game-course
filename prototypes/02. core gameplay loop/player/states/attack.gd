extends 'res://player/states/_state.gd'

# Use a circular area and hit everything facing the player there.

signal attack_start
const ATTACK_ANIMATIONS = ["attack_left", "attack_right"]

func _ready():
	pass

func enter():
	if player.look_direction.x == 1:
		player.AnimationPlayer.play("attack_right")
	if player.look_direction.x == -1:
		player.AnimationPlayer.play("attack_left")
	else:
		player.AnimationPlayer.play("attack_right")
	

func _input(event):
	pass

func _fixed_process(delta):
	pass

func _on_AnimationPlayer_finished():
	if not player.AnimationPlayer.get_current_animation() in ATTACK_ANIMATIONS:
		return
	if player.previous_state == player.States[player.WALK]:
		player.go_to_state(player.WALK)
	else:
		player.go_to_state(player.IDLE)