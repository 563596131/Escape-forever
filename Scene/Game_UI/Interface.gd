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
