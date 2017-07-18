# Null state to use in a Finite State Machine
extends Node

var target = null

func init(node):
    self.target = node

func enter():
    pass

func exit():
    pass


func _fixed_process(delta):
    print('No _process method defined')

func _input(event):
    print('No _input method defined')
