class_name Enemy extends Node2D

var move_speed: int = 0
var direction: int = 1
@onready var animated_sprite = $AnimatedSprite2D

func _init(speed: int = 100) -> void:
	move_speed = speed

func _process(_delta):
	detect_collision()

	move()

func detect_collision() -> void:
	if $RayCastRight.is_colliding() or not $RayCastBottomRight.is_colliding():
		flip_sprite(true)
		direction = -1
	if $RayCastLeft.is_colliding() or not $RayCastBottomLeft.is_colliding():
		flip_sprite(false)
		direction = 1

func flip_sprite(flip: bool) -> void:
	animated_sprite.flip_h = flip

func move() -> void:
		position.x += direction * move_speed * get_process_delta_time()

