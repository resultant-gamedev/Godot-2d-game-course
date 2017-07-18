extends KinematicBody2D

onready var Text = get_node("Label")

enum STATE_IDS {IDLE, WALK, ATTACK}

var current_state = null
onready var States = {
	IDLE:get_node('States/Idle'),
	WALK:get_node('States/Walk'),
	ATTACK:get_node('States/Attack')
}

func _ready():
	set_as_toplevel(true)
	set_fixed_process(true)
	# set_process_input(true)
	for key in States:
		States[key].target = self
	current_state = States[IDLE]


# Transition to a new state, if the transition is set
# Use a member of the STATE_IDS enum to set the new state
func go_to_state(state_id):
	current_state.exit()

	var new_state = null
	for key in States.keys():
		if key == state_id:
			new_state = States[key]
	new_state.enter()
	current_state = new_state


func _fixed_process(delta):
	current_state._fixed_process(delta)
	Text.set_text(current_state.get_name())

func _input(event):
	current_state._input(event)