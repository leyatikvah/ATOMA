extends Label

func _ready():
	text = GlobalControls.current_mode["name"]

func _on_controls_setting_changed(setting):
	match setting: 
		"ARROW":
			GlobalControls.current_mode = GlobalControls.arrows_mode
			GlobalControls.RefreshOptions(GlobalControls.current_mode)
		"KEYB.": 
			GlobalControls.current_mode = GlobalControls.keyboard_mode
			GlobalControls.RefreshOptions(GlobalControls.current_mode)
	pass # Replace with function body.
