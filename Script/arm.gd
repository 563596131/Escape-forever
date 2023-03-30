class_name Arm
extends Area2D

var Look_target :KinematicBody2D= null

var attack_target :KinematicBody2D = null
onready var IcoEctSet = find_node("IcoEctSet")
var age = 1
var max_attack = 5
var cooling = 1
var oldGoals = []
func _ready():
	age = OverallSituation.checkArm["Damage"]
	max_attack = OverallSituation.checkArm["Penetrate"]
	cooling = OverallSituation.checkArm["AttackSpeed"]
	IcoEctSet.texture = load(OverallSituation.checkArm["ImagePath"])
	$AnimationPlayer.playback_speed = cooling

