extends Area2D
#var velocity = Vector2()
var speed = 200

var ranks = 0

var data = {}
var age = 0
var lj = 0
var load_hit = "res://game/arms/hit/hit_1.tscn"
func _ready():
	speed = data["FlightSpeed"]
	lj =  data["Penetrate"]
func _physics_process(delta):
	global_position += Vector2(speed, 0).rotated(rotation)*delta
	if lj <= 0:
		queue_free()

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Node2D_body_entered(body):
	if body is KinematicComm:
		if body.ranks != ranks and lj > 0:
			lj -= 1
			var node = load(load_hit).instance()
			node.type = 1
			get_parent().get_parent().add_child(node)
			node.global_position = body.global_position
			node.rotation = rotation
			
			body.reduceHp(age,Vector2(500, 0).rotated(rotation))
		
	pass # Replace with function body.
