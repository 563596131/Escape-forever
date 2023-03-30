class_name KinematicComm
extends KinematicBody2D

var hp = 20
var max_hp = 10
var age = 1
var df = 0 #Shield

var repel = false

var generate = true

var ranks = 0
func death():
	pass

func _process(delta):
#	z_index = int(global_position.y)

	if hp <= 0:
		death()

func reduceHp(hurt,Attack_angle = Vector2(0,0)):
	hurt = hurt - df
	if hurt <= 0:
		return
	else:
		hp = hp - hurt
		be_attacked(Attack_angle)
	pass

func be_attacked(Attack_angle = Vector2(0,0)):
	pass
