extends Node2D


var type = 0
onready var fireball_sound = $FireBall
onready var iceball_sound = $IceBall
onready var darkball_sound = $DarkBall
onready var attack_sound = $MonsterHurt

func _ready():
	if type == 0:
		$AnimatedSprite.speed_scale = 1.5
		$AnimatedSprite.play("Stear")
		attack_sound.play()
		
	elif type == 1:
		$AnimatedSprite.speed_scale = 4
		$AnimatedSprite.play("FireBall")
		fireball_sound.play()
		
	elif type == 2:
		$AnimatedSprite.speed_scale = 4
		$AnimatedSprite.play("IceBall")
		iceball_sound.play()
	
	elif type == 3:
		$AnimatedSprite.speed_scale = 4
		$AnimatedSprite.play("DarkBall")
		darkball_sound.play()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	queue_free()
	pass # Replace with function body.
