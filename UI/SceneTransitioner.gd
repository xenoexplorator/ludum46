extends CanvasLayer

var transitioning : bool = false
var currentTransition : Transition
var factory : transition_factory

func _init():
	factory = transition_factory.new()

func go_to(input):
	if not transitioning:
		currentTransition = factory.CreateTransitionFor(input)
		commit_transition()

func commit_transition():
		transitioning = true
		add_child(currentTransition)
		$AnimationPlayer.play("transition")

func change():
	currentTransition.transition()
	remove_child(currentTransition)
	transitioning = false
