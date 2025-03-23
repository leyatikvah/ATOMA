extends Button
@onready var fairy = $AudioFairy
@onready var music_vol = $MusicVol 
@onready var sfx_vol = $SFXVol 

signal unselect_menu
signal ready_sliders

var current_entry = 0
var audio_list = [music_vol, sfx_vol]
var current_y = 217
var current_slider = 0

func _ready(): 
	fairy.visible = false

func _on_options_menu_menu_chosen(menu):
	if menu == self:
		fairy.visible = true
	pass # Replace with function body.

func _process(_delta):
	if fairy.visible == true: 
		emit_signal("ready_sliders")
		self.disabled = true
		audio_list = [music_vol, sfx_vol]
		FreezeFocus()
		
		if Input.is_action_pressed("ui_cancel"): 
			fairy.visible = false
			emit_signal("unselect_menu")
			self.disabled = false
		
		if Input.is_action_just_pressed("ui_up"):
			current_entry -= 1 
			current_y -= 45
			if current_entry < 0: 
				current_entry = audio_list.size() - 1
				current_y += audio_list.size() * 45
		elif Input.is_action_just_pressed("ui_down"):
			current_entry += 1 
			current_y += 45
			if current_entry > audio_list.size() - 1:
				current_entry = 0
				current_y = 217
		fairy.position.y = float(current_y)
		current_slider = audio_list[current_entry].get_child(0)
		current_slider.grab_focus()
		
func FreezeFocus(): 
	focus_neighbor_left = get_path()
	focus_neighbor_right = get_path()

func _on_music_volume_slider_focus_exited():
	self.grab_focus()
	pass # Replace with function body.

func _on_sfx_volume_slider_focus_exited():
	self.grab_focus()
	pass # Replace with function body.
