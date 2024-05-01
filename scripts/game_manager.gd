extends Node

var _score = 0
@onready var label = $Label

func add_score():
	_score += 10
	label.text = "Congrats!, Your score is " + str(_score) 
