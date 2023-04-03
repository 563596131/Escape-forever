class_name GameRoot
extends Node2D

onready var game_player = find_node("Player")
var generatePosMax = Vector2(350,350)
var generateMax = 4
var customs_pass_time_max = 30
var customs_pass_time = 30
var customs_pass = 0
var customs_passData = ReadFile.loadData("res://Object/to_configure/customs_pass.tscn")
var monster = ReadFile.loadData("res://Object/to_configure/monster.tscn")

func _ready():
	randomize()
	
	game_player = load(OverallSituation.role["CharacterScene"]).instance()
#	game_player.position = Vector2(400,300)
#	game_player.data = OverallSituation.role
	$YSort.add_child(game_player)
	
	OverallSituation.root = self
	OverallSituation.game_player = game_player
	


	


func _on_Timer_timeout():
	if customs_pass_time > 0:
		customs_pass_time -= 1
		$CanvasLayer/Interface/Label2.text = str(customs_passData["data"][customs_pass]["name"])
		$CanvasLayer/Interface/Label.text = str(customs_pass_time)
		var vec2 =  Vector2((generatePosMax.x/2)-(randi() % int(generatePosMax.x) + 1),(generatePosMax.y/2)-(randi() % int(generatePosMax.y) + 1))
		for i in customs_passData["data"][customs_pass]["MonsterBornID&Num"]:
			var id = i[0]
			for x in i[1]:
				var d = monster.data[int(id)]
				var monster = load(d["MonsterPath"]).instance()
				monster.speed = d["MonsterSpeed"]
				monster.hp = d["MonsterHp"]
				monster.age = d["MonsterAttack"]
				monster.position  = vec2 + Vector2(25 - randi() % 50,25 - randi() % 50)
				$YSort/monsters.add_child(monster)
	else:
		customs_pass += 1
		customs_pass_time = customs_pass_time_max
		for i in $YSort/monsters.get_children():
			i.queue_free()
		$"CanvasLayer/Interface/LevelUpCotatiner".visible = true
		if OverallSituation.lv >0:
			$Timer.stop()
			yield($"CanvasLayer/Interface/LevelUpCotatiner","hide")
			$Timer.start(1)
	
	if customs_pass >= 6:
		SceneManager.change_scene("res://Scene/Win_sence.tscn",{ "pattern": "squares", "pattern_leave": "squares" })
	

		
	pass # Replace with function body.
