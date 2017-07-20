# Simple state machine implementation
extends KinematicBody2D

var current_state = null
enum STATE_IDS {IDLE, WALK, ATTACK}

func _ready():
    go_to_state(IDLE)


func _process(event):
    # In this example, we group the code that handles switching states in one place,
    # and we only need 1 variable, the current_state, to transition between states
    # It's less error-prone than using several booleans

    # Entering the state
    if current_state == IDLE:
        if input_direction != Vector2():
            go_to_state(WALK)
        elif Input.is_action_pressed("attack"):
            go_to_state(ATTACK)
    if current_state == WALK:
        if input_direction == Vector2():
            go_to_state(IDLE)
        elif Input.is_action_pressed("attack"):
            go_to_state()
    
    # We separate the block where we enter the state from managing the actual states,
    # for clarity's sake
    if current_state == WALK:
        # logic to make the character walk, e.g. detect input and move
        pass
    elif current_state == IDLE:
        pass


func go_to_state(state_id):
    # Basic function that prevents the machine to re-enter the same state
    if current_state == state_id:
        return
    # Add code to clean up the current state as you exit it here
    current_state = state_id