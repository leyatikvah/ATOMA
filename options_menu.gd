extends Control
@onready var audio_button = $Audio
@onready var graphics_button = $Graphics
@onready var controls_button = $Controls

var frozen = false
var current_focus = 0
signal menu_chosen(menu: Node)

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalControls.RefreshOptions(GlobalControls.current_mode)
	audio_button.grab_focus()
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and frozen == false:
		get_tree().change_scene_to_file("res://menu_screen.tscn")
	elif Input.is_action_just_pressed("key_r"):
		get_tree().change_scene_to_file("res://menu_screen.tscn")

func _on_audio_pressed():
	frozen = true
	current_focus = audio_button
	emit_signal("menu_chosen", current_focus)
	pass # Replace with function body.

func _on_audio_unselect_menu():
	audio_button.focus_neighbor_left = controls_button.get_path()
	audio_button.focus_neighbor_right = graphics_button.get_path()
	audio_button.grab_focus()
	current_focus = 0
	frozen = false
	pass # Replace with function body.

func _on_graphics_unselect_menu():
	frozen = false
	graphics_button.focus_neighbor_left = audio_button.get_path()
	graphics_button.focus_neighbor_right = controls_button.get_path()
	graphics_button.grab_focus()
	current_focus = 0
	pass # Replace with function body.

func _on_graphics_pressed():
	frozen = true
	current_focus = graphics_button
	emit_signal("menu_chosen", current_focus)
	pass # Replace with function body.

func _on_controls_pressed():
	frozen = true
	current_focus = controls_button
	emit_signal("menu_chosen", current_focus)
	pass # Replace with function body.

func _on_controls_unselect_menu():
	frozen = false
	controls_button.focus_neighbor_left = graphics_button.get_path()
	controls_button.focus_neighbor_right = audio_button.get_path()
	controls_button.grab_focus()
	current_focus = 0
	pass # Replace with function body.
