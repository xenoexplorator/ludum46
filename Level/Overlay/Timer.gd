extends Label

var started = false
var elapsedTime : float = 0

func start():
	started = true

func stop():
	started = false

func _physics_process(delta):
	if started :
		elapsedTime += delta
		show_time()
	
func show_time():
	text = format_time()
	
func to_double_digits(number: int) -> String:
	return str(number) if number >= 10 else "0" + str(number)

func game_end():
	Score.elapsed_time = format_time()
	
func format_time():
	var seconds : int = elapsedTime
	var minutes : int = seconds / 60
	return to_double_digits(minutes) + " : " + to_double_digits(seconds % 60)
