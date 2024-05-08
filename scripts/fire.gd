class_name Fire extends AnimatableBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var kill_zone_collision: CollisionShape2D = $kill_zone/CollisionShape2D
@onready var trigger_collision: CollisionShape2D = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(body: Node) -> void:
	if body is Player:
		animated_sprite_2d.play("hit")
		await get_tree().create_timer(.3).timeout
		animated_sprite_2d.play("on")
		trigger_collision.disabled = true
		kill_zone_collision.disabled = false
		await get_tree().create_timer(3).timeout
		animated_sprite_2d.play("off")
		trigger_collision.disabled = false
		kill_zone_collision.disabled = true
