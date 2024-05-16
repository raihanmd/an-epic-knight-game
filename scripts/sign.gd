class_name Sign extends Area2D

@export var text: String
@export var label: Label
@export var container: Control
@export var background: MarginContainer

func _ready() -> void:
	container.visible = true
	label.text = text
	background.custom_minimum_size = label.size + Vector2(2, 2) 

#func _on_body_entered(body: Node2D) -> void:
	#if body is Player:
		#container.visible = true
#
#func _on_body_exited(body: Node2D) -> void:
	#if body is Player:
		#container.visible = false
