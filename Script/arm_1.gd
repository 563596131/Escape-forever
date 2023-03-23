extends Arm



onready var attack_range = find_node("attack_range")
onready var damage_target = find_node("Area2D")
var isAttack = true



var lj = 0


var load_hit = "res://game/arms/hit/hit_1.tscn"
func _ready():
	
	pass # Replace with function body.
	
func _physics_process(delta):
	if !is_instance_valid(Look_target):
		Look_target = null
	if !is_instance_valid(attack_target):
		attack_target = null
	
	
#	if global_position.distance_to()\
	if isAttack:
		if attack_target == null:
			if Look_target != null:
				look_at(Look_target.global_position)
		else:
			look_at(attack_target.global_position)
	#
		if attack_target != null:
			if isAttack:
				look_at(attack_target.global_position)
				$AnimationPlayer.play("attack")

	if gjyx:
		
		for i in damage_target.get_overlapping_bodies():
			if !oldGoals.has(i):
				if lj < max_attack:
#					print(i.name)
					if i is KinematicComm:
						oldGoals.append(i)
#						var node = load(load_hit).instance()
#						get_parent().get_parent().add_child(node)
#						node.global_position = i.global_position
#						node.rotation = rotation
						i.reduceHp(age,Vector2(500, 0).rotated(rotation))
						
				lj += 1
		isAttack = false
			
	if get_overlapping_bodies() != []:
		for body in get_overlapping_bodies():
			if body is KinematicBody2D:
				if Look_target == null:
					Look_target = body
				else:
					if Look_target.global_position.distance_to(global_position) > body.global_position.distance_to(global_position):
						Look_target = body
	else:
		Look_target = null
	if attack_range.get_overlapping_bodies() != []:
		for body in attack_range.get_overlapping_bodies():
			if body is KinematicBody2D:
				if attack_target == null:
					attack_target = body
				else:
					if attack_target.global_position.distance_to(global_position) > body.global_position.distance_to(global_position):
						attack_target = body
	else:
		attack_target = null

var gjyx = false
func _on_AnimationPlayer_animation_finished():
	isAttack = true
	gjyx = false
	lj = 0
	oldGoals = []
	pass # Replace with function body.


func _on_AnimationPlayer_animation_started():
	gjyx = true
	lj = 0
	oldGoals = []
	pass # Replace with function body.
