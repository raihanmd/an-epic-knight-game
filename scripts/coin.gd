class_name Coin extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if body is Player:
		game_manager.add_score()
		animation_player.play("pickup")
