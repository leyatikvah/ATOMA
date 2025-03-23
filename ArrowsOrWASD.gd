extends Sprite2D
#For this to work, the arrow sprite and the wasd sprite have to be the same dimensions. 

func _ready():
	var text = load(GlobalControls.current_mode["texture"])
	texture = text
	pass # Replace with function body.
