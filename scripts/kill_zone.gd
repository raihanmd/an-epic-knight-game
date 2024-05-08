class_name KillZone extends Area2D

const game_ever_scene = preload('res://scenes/ui/game_over.tscn')

func _on_body_entered(body):
	if body is Player: kill_player(body)
	Engine.time_scale = .5
	await get_tree().create_timer(1).timeout
	Engine.time_scale = 1
	get_tree().root.add_child(game_ever_scene.instantiate())

func kill_player(player: Player):
	player.is_alive = false
	player.velocity.y = -200
	player.velocity.x = 0
	player.get_node("die_sfx").play()
	player.get_node("CollisionShape2D").queue_free()
