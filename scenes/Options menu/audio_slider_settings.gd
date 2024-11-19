extends Control

@onready var audio_num_lbl = $Control/Audio_num_lbl2 as Label
@onready var h_slider = $HBoxContainer/HSlider as HSlider

@export_enum("Music", "Master") var bus_name: String

var bus_index: int = 0

func _ready() -> void:
	print("audio_num_lbl:", audio_num_lbl)
	print("h_slider:", h_slider)
	
	h_slider.value_changed.connect(self.on_value_changed)
	get_bus_name_by_index()
	set_audio_num_label_text()
	set_slider_value()

func set_audio_num_label_text() -> void:
	audio_num_lbl.text = str(h_slider.value * 100)

func get_bus_name_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_num_label_text()

func on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_num_label_text()
