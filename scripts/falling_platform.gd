class_name FallingPlatform extends CharacterBody2D

var is_falling: bool = false
var current_possition: Vector2
@onready var respawn_timer: Timer = $respawn_timer

func _ready() -> void:
	current_possition = transform.get_origin()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		await get_tree().create_timer(.5).timeout
		is_falling = true

func _physics_process(delta: float) -> void:
	if is_falling:
		falling(delta)
	else:
		set_back_position(delta)
	move_and_slide()

func falling(delta: float):
	$AnimatedSprite2D.play('off')
	velocity.y += 300 * delta
	await get_tree().create_timer(.3).timeout
	if respawn_timer.is_stopped():
		respawn_timer.start()

func set_back_position(delta: float):
	$AnimatedSprite2D.play('on')
	if not position <= current_possition:
		velocity.y -= 200 * delta
	else:
		position = current_possition
		velocity.y = 0

func _on_respawn_timer_timeout() -> void:
	is_falling = false
