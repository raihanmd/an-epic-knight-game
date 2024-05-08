class_name Trampoline extends AnimatableBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var isPlayerTouch: bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		isPlayerTouch = true
		throw_player(body)

func throw_player(body: Player):
	animated_sprite_2d.play('jump')
	await get_tree().create_timer(.2).timeout
	$boing_sfx.play()
	if isPlayerTouch:
		body.velocity.y = -500

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		isPlayerTouch = false
