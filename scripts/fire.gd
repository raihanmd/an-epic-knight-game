class_name Fire extends AnimatableBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var kill_zone_collision: CollisionShape2D = $kill_zone/CollisionShape2D

func _on_area_2d_body_entered(_body: Node) -> void:
	call_deferred("_disable_collision")

func _disable_collision() -> void:
	$Timer.stop()
	animated_sprite_2d.play('hit')
	kill_zone_collision.disabled = true

func _on_area_2d_body_exited(_body: Node) -> void:
	call_deferred("_enable_collision")

func _enable_collision() -> void:
	await get_tree().create_timer(.1).timeout
	$Timer.start()
	animated_sprite_2d.play('on')
	kill_zone_collision.disabled = false

func _on_timer_timeout() -> void:
	animated_sprite_2d.play('off')
	kill_zone_collision.disabled = true
