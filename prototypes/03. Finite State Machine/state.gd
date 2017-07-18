var States = {
}

var state = null
var previous_state = null

func go_to_state(state_id):
    pass


func _ready():
    # Store references to the available states
    for state in get_node("States").get_children():
        States[state.get_name()] = state

	set_process_input(true)
	set_fixed_process(true)


func _fixed_process(delta):
	state._fixed_process(delta)

func _input(event):
	state._input(event)


class SampleState:
    var node = null
    var allowed_transitions = {}

	func _init(node):
        self.node = node

	func _fixed_process(delta):
		pass

	func _input(event):
		pass

	func _exit():
    
        pass