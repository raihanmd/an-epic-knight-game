class_name Door extends Area2D

var isPlayerCollide: bool = false
var isMouseTouch: bool = false

func _on_body_entered(body: Node) -> void:
	if body is Player:
		isPlayerCollide = true

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if isPlayerCollide and isMouseTouch:
				$AnimatedSprite2D.play("open")
				$AudioStreamPlayer2D.play()
				await $AnimatedSprite2D.animation_finished
				get_tree().change_scene_to_file("res://scenes/level/level_2.tscn")

func _on_mouse_entered() -> void:
	isMouseTouch = true

func _on_mouse_exited() -> void:
	isMouseTouch = false
