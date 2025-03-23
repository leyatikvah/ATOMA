extends HSlider
var is_disabled = true
@export var bus_name: String
var bus_index: int

func _ready() -> void: 
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index)) # load it 

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _process(delta):
	if Input.is_action_pressed("ui_cancel") and is_disabled == false:
		self.release_focus()
		emit_signal("focus_exited")
		is_disabled = true
	pass

func _on_audio_ready_sliders():
	is_disabled = false
	pass # Replace with function body.
