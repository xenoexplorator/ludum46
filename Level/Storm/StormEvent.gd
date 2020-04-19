class_name StormEvent

enum EventType {
	NONE,
	TOGGLE_RANDOM,
	SET_RATE,
	SPAWN_FRONT,
	SPAWN_CLUSTER,
}

export (EventType) var event_type := EventType.NONE
export (float) var timing
export (Dictionary) var parameters := {
	duration = 0,
	origin = Vector2(),
	angle = 0,
	speed = 100,
	num_drops = 3,
	start_angle = -15,
	end_angle = 15,
	radius = 30,
}


func _init(kind: int, when: float, params: Dictionary = {}):
	event_type = kind
	timing = when
	parameters = params
	if parameters.has("duration"):
		parameters["end_timing"] = timing + parameters["duration"]


func get_param(param: String):
	return parameters[param]

func update_after_run():
	if parameters.has("repeat"):
		if parameters["duration"] == 0 or timing < parameters["end_timing"]:
			timing += parameters["repeat"]
