class_name AboutMenu
extends Control


@onready var exit_button = $MarginContainer/VBoxContainer/Control/Exit_button_about as Button

signal exit_about_menu

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed() -> void:
	exit_about_menu.emit()
	set_process(false)
