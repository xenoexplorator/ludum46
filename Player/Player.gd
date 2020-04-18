extends RigidBody2D

class_name Player

export (int) var MovementSpeed : int
export (float) var UpdraftMultiplier : float
export (float) var HealingSpeed : float = 4
export (float) var DamagePerDroplet : float = 15

const MaskNoWater = 15
const MaskWithWater = 31

var is_in_heat : bool = false

signal barrier_created(position, target)

func _physics_process(delta):
	#Movement
	var thrust : Vector2 = get_movement_force(get_inputs())
	if thrust.x > 0:
		$Sprite.scale.x = abs($Sprite.scale.x)
	if thrust.x < 0:
		$Sprite.scale.x = abs($Sprite.scale.x) * -1
	apply_central_impulse(thrust)
	
	#Spawn Barrier
	if Input.is_action_just_pressed("spawn_barrier"):
		$BarrierSkill.use_skill()
	
	if is_in_heat:
		$HeatGauge.value += (100/HealingSpeed) * delta
		collision_mask = MaskWithWater
		set_alpha()

func hurt():
	$HeatGauge.value -= DamagePerDroplet
	set_alpha()
	if $HeatGauge.value == 0:
		collision_mask = MaskNoWater

func set_alpha():
	var alpha = (0.8 * ($HeatGauge.value/100)) + 0.2
	$Sprite.modulate = Color(1, 1, 1, alpha)

func get_inputs() -> Vector2:
	var dir : Vector2
	dir.y = 1 if down_pressed() else -1 * UpdraftMultiplier if up_pressed() else 0
	dir.x = 1 if right_pressed() else -1 if left_pressed() else 0
	return dir.normalized()

func get_movement_force(direction : Vector2) -> Vector2:
	var force : Vector2 = direction * MovementSpeed
	if should_apply_updraft(force):
		force = force * UpdraftMultiplier
	return force

func should_apply_updraft(force : Vector2) -> bool:
	return force.y < 0

func up_pressed() -> bool:
	return Input.is_action_pressed("move_up") if not Input.is_action_pressed("move_down") else false

func down_pressed() -> bool:
	return Input.is_action_pressed("move_down") if not Input.is_action_pressed("move_up") else false

func right_pressed() -> bool:
	return Input.is_action_pressed("move_right") if not Input.is_action_pressed("move_left") else false

func left_pressed() -> bool:
	return Input.is_action_pressed("move_left") if not Input.is_action_pressed("move_right") else false


func _on_Player_body_entered(body):
	if(linear_velocity.length() > 250):
		$AnimationPlayer.play("stretch",-1,2,false)
