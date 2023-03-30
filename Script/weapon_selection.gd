extends Control

onready var armHBoxContainer = find_node("armHBoxContainer")
onready var armTextureRect = find_node("armTextureRect")
onready var richTextLabel = find_node("RichTextLabel")
onready var nameLabel = find_node("nameLabel")
onready var typeLabel = find_node("typeLabel")
var checkArm = {} setget checkArmSet
# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/MarginContainer/HBoxContainer/MarginContainer2.visible = false
	$Button.visible = false
#	var armsData = ReadFile.loadData("res://to_configure/arms.tscn")
	for i in OverallSituation.role["WeaponPot"]:
			var armsdata = OverallSituation.armsData.data[i]
		
			if armsdata["InitialChoice"]:
				var arm = load("res://Object/weapon.tscn").instance()
				armHBoxContainer.add_child(arm)
				arm.data = armsdata
				arm.connect("on_click",self,"on_click")	
	$MarginContainer/VBoxContainer/MarginContainer/HBoxContainer/MarginContainer/TextureRect.texture = load(OverallSituation.role["CharacterImage"])
	pass # Replace with function body.
	
func on_click(node):
	print("asdasd")
	self.checkArm = node.data
	OverallSituation.checkArm = node.data

func checkArmSet(value):
	$Button.visible = true
	$MarginContainer/VBoxContainer/MarginContainer/HBoxContainer/MarginContainer2.visible = true
	checkArm = value
	armTextureRect.texture = load(checkArm["ImagePath"])
	nameLabel.text = checkArm["Name"]
	typeLabel.text = checkArm["WeaponType"]
	richTextLabel.bbcode_text = "[color=#f7ff00]Damage : [/color] [color=#ffffff]" + str(checkArm["Damage"])+"[/color]\n"
	if checkArm["Crit"] != 1:
		richTextLabel.bbcode_text += "[color=#f7ff00]Crit : [/color] [color=#ffffff]" + str(checkArm["Crit"])+"[/color]\n"
	richTextLabel.bbcode_text += "[color=#f7ff00]AttackSpeed : [/color] [color=#ffffff]" + str(checkArm["AttackSpeed"])+"S[/color]\n"
	richTextLabel.bbcode_text += "[color=#f7ff00]Range : [/color] [color=#ffffff]" + str(checkArm["Range"])+"[/color]\n"
	if checkArm["TriggerEffect"] != []:
		richTextLabel.bbcode_text += "[color=#f7ff00]TriggerEffect : [/color]"
	for i in checkArm["TriggerEffect"]:
		richTextLabel.bbcode_text += i+" "
#			str(checkArm["Range"])
#		richTextLabel.bbcode_text += "[color=#f7ff00]Range : [/color] [color=#ffffff]" + str(checkArm["Range"])+"[/color]\n"

func _on_Button_pressed():
	
	SceneManager.change_scene("res://Scene/main game.tscn",{ "pattern": "squares", "pattern_leave": "squares" })
	pass # Replace with function body.
