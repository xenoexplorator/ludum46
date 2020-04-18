extends TextureProgress

func update_barrier_recharge(percentage : float):
	if value != 100 && percentage == 1:
		$AnimationPlayer.play("ready")
	value = percentage * 100
