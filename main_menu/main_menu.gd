class_name MainMenu
extends Control

@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var background_music = $Background_Music
@onready var setting_button = $MarginContainer/HBoxContainer/VBoxContainer/Setting_Button as Button
@onready var Settings_menu = $Settings_Menu as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	Settings_menu.visible = false  # Start hidden
	Settings_menu.set_process(false)  # Disable processing initially
	handle_connecting_signals()

func on_setting_pressed() -> void:
	margin_container.visible = false
	Settings_menu.set_process(true)  # Enable processing for the settings menu
	Settings_menu.visible = true

func on_exit_pressed() -> void:
	get_tree().quit()

func on_exit_options_menu() -> void:
	margin_container.visible = true
	Settings_menu.set_process(false)  # Disable processing for the settings menu
	Settings_menu.visible = false

func handle_connecting_signals() -> void:
	setting_button.pressed.connect(on_setting_pressed)
	exit_button.pressed.connect(on_exit_pressed)
	Settings_menu.exit_options_menu.connect(on_exit_options_menu)
	
	background_music.play()
