extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ReturnButton_pressed():
	SceneManager.change_scene("res://Scene/Start_Sence.tscn",{ "pattern": "squares", "pattern_leave": "squares" })
	pass # Replace with function body.
