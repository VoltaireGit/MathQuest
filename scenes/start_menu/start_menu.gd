class_name StartMenu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Control/back_button_start as Button

signal exit_start_menu

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed() -> void:
	exit_start_menu.emit()
	set_process(false)
