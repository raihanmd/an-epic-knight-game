extends Node2D

func _on_texture_button_toggled(toggled_on: bool) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/level/level_1.tscn')
