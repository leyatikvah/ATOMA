extends Button
@onready var fairy = $ControlsFairy
@onready var lang_label = $Language
@onready var controls_label = $Controls

signal unselect_menu
signal setting_changed(setting: String)

var settings = {
	"lang_label": ["ENG.", "FR.", "JP.", "HE."],
	"controls_label": ["ARROW", "KEYB."]
}

var current_entry = 0
var current_y = 184
var current_setting = 0
var label = "default"

func _ready(): 
	fairy.visible = false
	pass

func _process(_delta):
	if fairy.visible == true: 
		self.disabled = true
		var controls_list = ["lang_label", "controls_label"]
		var controls_list_nodes = [lang_label, controls_label]
		FreezeFocus()
		
		if Input.is_action_pressed("ui_cancel"): 
			fairy.visible = false
			emit_signal("unselect_menu")
			self.disabled = false
		
		if Input.is_action_just_pressed("ui_up"):
			current_entry -= 1 
			current_y -= 45
			if current_entry < 0: 
				current_entry = controls_list.size() - 1
				current_y += controls_list.size() * 45
		elif Input.is_action_just_pressed("ui_down"):
			current_entry += 1 
			current_y += 45
			if current_entry > controls_list.size() - 1:
				current_entry = 0
				current_y = 184
		elif Input.is_action_just_pressed("ui_left"): 
			current_setting -= 1
			var current_list = settings[controls_list[current_entry]]
			if current_setting < 0: 
				current_setting = current_list.size() - 1
			
			var new_text = current_list[current_setting]
			var label = controls_list_nodes[current_entry].get_child(0)
			
			label.text = new_text
			#emit signal that a setting has changed
			emit_signal("setting_changed", new_text)
		elif Input.is_action_just_pressed("ui_right"): 
			current_setting += 1
			var current_list = settings[controls_list[current_entry]]
			if current_setting > current_list.size() - 1: 
				current_setting = 0
			
			var new_text = current_list[current_setting]
			label = controls_list_nodes[current_entry].get_child(0)
			
			label.text = new_text
			#emit signal that a setting has changed
			emit_signal("setting_changed", new_text)
		fairy.position.y = float(current_y)
		
func FreezeFocus(): 
	focus_neighbor_left = get_path()
	focus_neighbor_right = get_path()

func _on_options_menu_menu_chosen(menu):
	if menu == self:
		fairy.visible = true
	pass # Replace with function body.
