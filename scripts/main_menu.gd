extends Node2D

func _on_texture_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$'/root/Music'.play()
	else:
		$'/root/Music'.stop()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/level/level_1.tscn')
