extends Control
@onready var table_button =$Table
 #load the mode in save file

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalControls.RefreshOptions(GlobalControls.current_mode)
	table_button.grab_focus()
	
	GlobalAudio.PlayMusicGame()
	pass # Replace with function body.
	
func _process(_delta):
	if Input.is_action_just_pressed("key_r"):
		get_tree().reload_current_scene()

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options_menu.tscn")  
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
