extends Node2D

func _ready():
	var armsData = OverallSituation.armsData
	
	var arm = load(armsData.type[OverallSituation.checkArm["WeaponType"]]).instance()
	add_child(arm)
	arm.position = Vector2(30,30)
	arm = load(armsData.type[OverallSituation.checkArm["WeaponType"]]).instance()
	add_child(arm)
	arm.position = Vector2(30,-30)
	arm = load(armsData.type[OverallSituation.checkArm["WeaponType"]]).instance()
	add_child(arm)
	arm.position = Vector2(-30,30)
	pass # Replace with function body.
	
func _physics_process(delta):
	global_position = lerp(global_position , get_parent().game_player.global_position - Vector2(0,50), 10*delta)
#	global_position = get_parent().game_player.global_position
