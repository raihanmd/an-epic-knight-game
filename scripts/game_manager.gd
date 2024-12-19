class_name GameManager extends Node

signal energy_change(energy: int)
signal score_change(score: int)

@export var energy_bar: ProgressBar
@export var score_label: Label

func _on_energy_change(energy: int) -> void:
	energy_bar.value = energy


func _on_score_change(score: int) -> void:
	score_label.text = 'Score: ' + str(score)
