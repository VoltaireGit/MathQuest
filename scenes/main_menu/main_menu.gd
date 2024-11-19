class_name MainMenu
extends Control


@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var background_music = $Background_Music
@onready var setting_button = $MarginContainer/HBoxContainer/VBoxContainer/Setting_Button as Button
@onready var about_button = $MarginContainer/HBoxContainer/VBoxContainer/About_Button as Button
@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var Settings_menu = $Settings_Menu as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer
@onready var about_menu = $About_menu as AboutMenu
@onready var start_menu = $Start_menu as StartMenu


func _ready():
	Settings_menu.visible = false  # Start hidden
	Settings_menu.set_process(false)  # Disable processing initially
	about_menu.visible = false  # Start hidden
	about_menu.set_process(false)  # Disable processing initially
	start_menu.visible = false  # Start hidden
	start_menu.set_process(false)  # Disable processing initially
	
	handle_connecting_signals()
	


func on_setting_pressed() -> void:
	margin_container.visible = false
	Settings_menu.set_process(true)  # Enable processing for the settings menu
	Settings_menu.visible = true

func on_about_pressed() -> void:
	margin_container.visible = false
	about_menu.set_process(true)  # Enable processing for the about menu
	about_menu.visible = true

func on_start_pressed() -> void:
	margin_container.visible = false
	start_menu.set_process(true)  # Enable processing for the start menu
	start_menu.visible = true

func on_exit_pressed() -> void:
	get_tree().quit()

func on_exit_options_menu() -> void:
	margin_container.visible = true
	Settings_menu.set_process(false)  # Disable processing for the settings menu
	Settings_menu.visible = false

func on_exit_about_menu() -> void:
	margin_container.visible = true
	about_menu.set_process(false)  # Disable processing for the about menu
	about_menu.visible = false

func on_exit_start_menu() -> void:
	margin_container.visible = true
	start_menu.set_process(false)  # Disable processing for the start menu
	start_menu.visible = false

func handle_connecting_signals() -> void:
	setting_button.pressed.connect(on_setting_pressed)
	about_button.pressed.connect(on_about_pressed)
	start_button.pressed.connect(on_start_pressed)
	exit_button.pressed.connect(on_exit_pressed)
	Settings_menu.exit_options_menu.connect(on_exit_options_menu)
	about_menu.exit_about_menu.connect(on_exit_about_menu)
	start_menu.exit_start_menu.connect(on_exit_start_menu)
