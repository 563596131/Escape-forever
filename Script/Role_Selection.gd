extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var roleData = ReadFile.loadData("res://Object/to_configure/role.tscn")
	for i in roleData.data:
		var node = load("res://Scene/Game_UI/CharacterChoose.tscn").instance()
		node.data = i
		node.connect("on_click",self,"on_click")
		$HBoxContainer/VBoxContainer/VBoxContainer/ScrollContainer/CharacterChooseBox.add_child(node)
	pass # Replace with function body.

func on_click(node):
	$HBoxContainer/MarginContainer/MarginContainer/RichTextLabel.text = "Name: " + str(node.data["Name"]) + "\n"
	$HBoxContainer/MarginContainer/MarginContainer/RichTextLabel.text += "Hp: " + str(node.data["Hp"]) + "\n"
	$HBoxContainer/MarginContainer/MarginContainer/RichTextLabel.text += "Speed: " + str(node.data["Speed"]) + "\n"
	$HBoxContainer/MarginContainer/MarginContainer/RichTextLabel.text += "Introduction: " + str(node.data["CharacterIntroduction"]) + "\n"
	OverallSituation.role = node.data
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	SceneManager.change_scene("res://Scene/Start_sence.tscn",{ "pattern": "squares", "pattern_leave": "squares" })
	pass # Replace with function body.


func _on_Button2_pressed():
	
	if not OverallSituation.role.empty():
		SceneManager.change_scene("res://Scene/weapon_selection.tscn",{ "pattern": "squares", "pattern_leave": "squares" })
	pass # Replace with function body.
