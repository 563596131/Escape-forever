extends KinematicComm

var speed = 150

var velocity = Vector2()
func _ready():
	speed = OverallSituation.role["Speed"]
	hp = OverallSituation.role["Hp"]
	ranks = 1

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * 200

func _physics_process(delta):
	OverallSituation.hp = hp
	if hp <= 0 :
		SceneManager.change_scene("res://Scene/End_sence.tscn",{ "pattern": "squares", "pattern_leave": "squares" })
	get_input()
	velocity = move_and_slide(velocity*delta*speed)
	
	
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0 :
		$AnimatedSprite.flip_h = true
	
	if velocity == Vector2(0,0):
		$AnimatedSprite.play("Idle")
		$CPUParticles2D.emitting = false
	else:
		$AnimatedSprite.play("move")
		$CPUParticles2D.emitting = true

