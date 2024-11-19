class_name PauseTab
extends Control

@onready var resume: Button = $PanelContainer/MarginContainer/Control/resume
@onready var restart: Button = $PanelContainer/MarginContainer/Control/restart
@onready var quit: Button = $PanelContainer/MarginContainer/Control/quit

signal exit_pause_menu

func _ready():
	quit.button_down.connect (on_quit_pressed)
	set_process(false)

func on_quit_pressed() -> void:
	exit_pause_menu.emit()
	set_process(false)
