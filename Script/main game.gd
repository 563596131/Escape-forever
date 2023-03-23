class_name GameRoot
extends Node2D

onready var game_player = find_node("Player")
var generatePosMax = Vector2(350,350)
var generateMax = 4

func _ready():
	randomize()

	game_player = find_node("Player")
	OverallSituation.root = self
	OverallSituation.game_player = game_player

