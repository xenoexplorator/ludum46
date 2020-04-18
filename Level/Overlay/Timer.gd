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
	var seconds : int = elapsedTime
	var minutes : int = seconds / 60
	text = to_double_digits(minutes) + " : " + to_double_digits(seconds % 60)
	print(elapsedTime)
	print(str(seconds) + " seconds")
	print(str(minutes) + " minutes")
	
func to_double_digits(number: int) -> String:
	return str(number) if number >= 10 else "0" + str(number)
