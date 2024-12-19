class_name  Fireball extends Area2D

var speed = 200

func _process(delta: float) -> void:
	transform.x += speed * delta
