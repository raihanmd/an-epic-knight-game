class_name GameManager extends Node

var _score = 0

func add_score():
	_score += 10
	%ui/ScoreText.text = "Score: " + str(_score)

func handle_energy(energy: int):
	%ui/EnergyBar.value = energy

