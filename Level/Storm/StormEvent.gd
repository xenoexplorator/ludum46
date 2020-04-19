class_name StormEvent

enum EventType {
	NONE,
	TOGGLE_RANDOM,
	SET_RATE,
	SPAWN_FRONT,
	SPAWN_CLUSTER,
	SPAWN_LOG,
}

export (EventType) var event_type := EventType.NONE
export (float) var timing
export (Dictionary) var parameters := {}


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
		if not parameters.has("duration") or timing < parameters["end_timing"]:
			timing += parameters["repeat"]
