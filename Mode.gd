extends Label
#Signal responds only if string == WINDOW or FULL

func _ready():
	if GlobalOptions.is_windowed == true:
		text = "WINDOW"
	else: 
		text = "FULL"

func _on_graphics_setting_changed(setting):
	match setting: 
		"WINDOW":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			GlobalOptions.is_windowed = true
		"FULL": 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			GlobalOptions.is_windowed = false
	
	#save this in a file - coming with save and load system
	pass # Replace with function body.
