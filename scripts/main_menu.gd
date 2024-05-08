extends Node2D

func _on_texture_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$'/root/Music'.play()
	else:
		$'/root/Music'.stop()
