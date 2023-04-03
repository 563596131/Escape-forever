extends KinematicComm

export (int) var speed = 70

onready var target = position
onready var AttackTimer = find_node("AttackTimer")
var velocity = Vector2()

var death = false
#var agg = 0
var jtjl = Vector2()

var isAttack = true
func _init():
	ranks = 2
func _ready():
#	$AnimatedSprite.visible = false
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("generate")
func _physics_process(delta):
	if !death and !generate:
		if is_instance_valid(OverallSituation.game_player):
			target = OverallSituation.game_player.global_position
			velocity = position.direction_to(target) * speed
#			velocity += "disabled"
			if position.distance_to(target) < 500:
				visible = true
			else:
				visible = false
			if position.distance_to(target) > 5:
				velocity = move_and_slide(velocity + jtjl)
			
			if OverallSituation.game_player.global_position.x > global_position.x:
				$AnimatedSprite.flip_h = false
			elif OverallSituation.game_player.global_position.x < global_position.x:
				$AnimatedSprite.flip_h = true
			if target.distance_to(global_position) < 5:
				if isAttack:
					for i in  $Area2D.get_overlapping_bodies():
						if i is KinematicComm and i != self:
#							print(i.name)
							if i.ranks == 1:
								
								i.reduceHp(age)
#					OverallSituation.be_attacked()
					isAttack = false
					AttackTimer.start(0.5)

func _on_AttackTimer_timeout():
	isAttack = true
	pass # Replace with function body.

func death():
	$AnimatedSprite.speed_scale = 3
	$AnimatedSprite.play("death")
	
	death = true
	$CollisionShape2D.disabled = true
	pass
func be_attacked(Attack_angle = Vector2(0,0)):
	$AnimationPlayer.play("be_attacked")
	jtjl = Attack_angle
	$repelTimer.start(0.05)
#	move_and_slide()
	pass

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "death":
		OverallSituation.xp += 10
		queue_free()
	pass # Replace with function body.

func _on_repelTimer_timeout():
	jtjl = Vector2(0,0)
	pass # Replace with function body.

func _on_AnimatedSprite2_animation_finished():
	$AnimatedSprite2.visible = false
#	$AnimatedSprite.visible = true
	generate = false
	$CollisionShape2D.disabled = false
	pass # Replace with function body.
	
