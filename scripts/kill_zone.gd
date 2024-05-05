class_name KillZone extends Area2D

func _on_body_entered(body):
	if body is Player: remove_player(body)
	Engine.time_scale = .5
	await get_tree().create_timer(1).timeout
	reload_scene()
	
func reload_scene():
	Engine.time_scale = 1
	get_tree().reload_current_scene()

func remove_player(player: Player):
	player.is_alive = false
	player.velocity.y = -200
	player.get_node("die_sfx").play()
	player.get_node("CollisionShape2D").queue_free()
