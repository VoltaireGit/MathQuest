extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture_button = $TextureButton  # Replace with the correct node path
	texture_button.texture_normal = preload("res://picture/FLASHCARD.png")

func _on_TextureButton_pressed():
	print("Button Pressed!")
