extends Node2D

export (float) var cooldown: float
export (float) var shield_recharge : float #on droplet block

var elapsed : float = 0

var skill_used : bool = false

func use_skill():
	if not skill_used:
		var player = get_parent()
		player.emit_signal("barrier_created", player.position, player)
		skill_used = true


func _physics_process(delta):
	if skill_used:
		elapsed += delta
		var percentage_recharge = min(elapsed/cooldown, 1)
		get_tree().call_group("hud", "update_barrier_recharge", percentage_recharge)
		if percentage_recharge == 1:
			skill_used = false
			elapsed = 0
