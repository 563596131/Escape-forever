extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$"PlayerStateContatiner/PlayerState/HP&EX/HP".max_value = OverallSituation.role["Hp"]
	$PlayerStateContatiner/PlayerState/PlayerIcon/TextureRect2.texture = load(OverallSituation.role["CharacterImage"])
	pass # Replace with function body.

func _physics_process(delta):
	$"PlayerStateContatiner/PlayerState/HP&EX/HP".value = OverallSituation.hp
	$"PlayerStateContatiner/PlayerState/HP&EX/EX".value = OverallSituation.xp
	if OverallSituation.xp >= 100:
		OverallSituation.xp = 0
		OverallSituation.lv += 1
	$PlayerStateContatiner/Money/SkillNumBG/SkillNum.text = str(OverallSituation.lv)
	$LevelUpCotatiner/HBoxContainer/ArributeListContainer/ArributeList/MarginContainer/ScrollContainer/ArrtibuteBoxContainer/Attribute/AttributeContainer/AttributeValue.text = str(OverallSituation.game_player.hp)
	$LevelUpCotatiner/HBoxContainer/ArributeListContainer/ArributeList/MarginContainer/ScrollContainer/ArrtibuteBoxContainer/Attribute3/AttributeContainer/AttributeValue.text = str(OverallSituation.game_player.speed)
	$LevelUpCotatiner/HBoxContainer/ArributeListContainer/ArributeList/MarginContainer/ScrollContainer/ArrtibuteBoxContainer/Attribute2/AttributeContainer/AttributeValue.text = str(OverallSituation.game_player.age)
	$LevelUpCotatiner/HBoxContainer/ArributeListContainer/ArributeList/MarginContainer/ScrollContainer/ArrtibuteBoxContainer/Attribute4/AttributeContainer/AttributeValue.text = str(OverallSituation.game_player.df)




func _on_ChooseButton_pressed_hp():
	if OverallSituation.lv > 1:
		OverallSituation.game_player.hp += 5  
		OverallSituation.lv -= 1
	else:
		$LevelUpCotatiner.visible = false
	pass # Replace with function body.


func _on_ChooseButton_pressed_attack():
	if OverallSituation.lv > 1:
		OverallSituation.game_player.age += 1	
		OverallSituation.lv -= 1
	else:
		$LevelUpCotatiner.visible = false


func _on_ChooseButton_pressed_speed():
	if OverallSituation.lv > 1:
		OverallSituation.game_player.speed += 5
		OverallSituation.lv -= 1
	else:
		$LevelUpCotatiner.visible = false

func _on_ChooseButton_pressed_df():
	if OverallSituation.lv > 1:
		OverallSituation.game_player.df +=5
		OverallSituation.lv -= 1
	else:
		$LevelUpCotatiner.visible = false
