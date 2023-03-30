extends BaseControl


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var data = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = data["Name"]
	$TextureRect.texture = load(data["CharacterImage"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
