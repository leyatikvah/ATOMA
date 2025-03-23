extends Label
@onready var mode = GlobalControls.current_mode
@onready var navigation_texture = $ArrowsOrWASD

# Called when the node enters the scene tree for the first time.
func _ready():
	ExtractControls(mode)
	navigation_texture.position.x = position.x - 435
	navigation_texture.position.y = position.y - 438
	pass # Replace with function body.
	
func ExtractControls(mode): 
	var select = mode["ui_accept"]
	var cancel = mode["ui_cancel"]
	
	var select_text = OS.get_keycode_string(select)
	var cancel_text = OS.get_keycode_string(cancel)
	
	text = ": navigate [" + select_text + "]: select" + " [" + cancel_text + "]: quit/return"
