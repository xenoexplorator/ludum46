extends Node

class_name transition_factory


func CreateTransitionFor(input) -> Transition:
	if input is PackedScene:
		return Scene_Transition.new(input)
	if input is String:
		return PathSceneTransition.new(input)
	if input == null:
		return Exit_Transition.new()
	return NullTransition.new()
