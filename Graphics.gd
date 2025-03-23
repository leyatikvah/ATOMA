extends Button
@onready var fairy = $GraphicsFairy
@onready var screen_label = $Screen
@onready var color_label = $Color
@onready var fontsize_label = $FontSize

var settings = {
	"screen_label": ["WINDOW", "FULL"],
	"color_label": ["BLUE", "RED", "GREEN"],
	"fontsize_label": ["NODATA", "NOPE"]
}

signal unselect_menu
signal setting_changed(setting: String)

var current_entry = 0
var current_y = 217
var current_setting = 0
var label = "default"

func _ready(): 
	#default setting text is global data 
	fairy.visible = false

func _on_options_menu_menu_chosen(menu):
	if menu == self:
		fairy.visible = true
	pass # Replace with function body.

func _process(_delta):
	if fairy.visible == true: 
		self.disabled = true
		var graphics_list = ["screen_label", "color_label", "fontsize_label"]
		var graphics_list_nodes = [screen_label, color_label, fontsize_label]
		FreezeFocus()
		
		if Input.is_action_pressed("ui_cancel"): 
			fairy.visible = false
			emit_signal("unselect_menu")
			self.disabled = false
		
		if Input.is_action_just_pressed("ui_up"):
			current_entry -= 1 
			current_y -= 45
			if current_entry < 0: 
				current_entry = graphics_list.size() - 1
				current_y += graphics_list.size() * 45
		elif Input.is_action_just_pressed("ui_down"):
			current_entry += 1 
			current_y += 45
			if current_entry > graphics_list.size() - 1:
				current_entry = 0
				current_y = 217
		elif Input.is_action_just_pressed("ui_left"): 
			current_setting -= 1
			var current_list = settings[graphics_list[current_entry]]
			if current_setting < 0: 
				current_setting = current_list.size() - 1
			
			var new_text = current_list[current_setting]
			var label = graphics_list_nodes[current_entry].get_child(0)
			
			label.text = new_text
			#emit signal that a setting has changed
			emit_signal("setting_changed", new_text)
		elif Input.is_action_just_pressed("ui_right"): 
			current_setting += 1
			var current_list = settings[graphics_list[current_entry]]
			if current_setting > current_list.size() - 1: 
				current_setting = 0
			
			var new_text = current_list[current_setting]
			label = graphics_list_nodes[current_entry].get_child(0)
			
			label.text = new_text
			#emit signal that a setting has changed
			emit_signal("setting_changed", new_text)
		fairy.position.y = float(current_y)
		
func FreezeFocus(): 
	focus_neighbor_left = get_path()
	focus_neighbor_right = get_path()

