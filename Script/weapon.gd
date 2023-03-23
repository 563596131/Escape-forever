extends BaseControl

var data = {} setget setData

func _ready():
	pass # Replace with function body.

func setData(value):
	data = value
	$TextureRect2.texture = load(data["ImagePath"])
	
	pass

func _on_MarginContainer_on_click(node):
	$AnimationPlayer.play("on_click")
	pass # Replace with function body.
