class_name GameManager extends Node

var _score = 0

func add_score():
	_score += 10
	%ScoreText.text = "Score: " + str(_score)
