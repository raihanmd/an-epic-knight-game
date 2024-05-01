extends Node2D

const MOVE_SPEED = 60

var direction = 1
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		animated_sprite.flip_h = true
		direction = -1
	if ray_cast_left.is_colliding():
		animated_sprite.flip_h = false
		direction = 1

	position.x += direction * MOVE_SPEED * delta
