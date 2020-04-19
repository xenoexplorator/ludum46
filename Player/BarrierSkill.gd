extends Node2D

export (float) var cooldown: float
export (float) var shield_recharge : float #on droplet block
export (float) var cost : float = 40

var elapsed : float = 0

var skill_used : bool = false

func use_skill():
#	if not skill_used:
	var player = get_parent()
	player.emit_signal("barrier_created", player.position, player)
	player.spend_fuel(cost)


func _physics_process(delta):
#	if skill_used:
#		if get_parent().is_in_heat :
#			elapsed += delta * 2
#		else:
#			elapsed += delta
#		var percentage_recharge = min(elapsed/cooldown, 1)
#		get_tree().call_group("hud", "update_barrier_recharge", percentage_recharge)
#		if percentage_recharge == 1:
#			skill_used = false
#			elapsed = 0
	pass
