class_name KillZone extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	body.isAlive = false
	body.velocity.y = -200
	body.get_node("die_sfx").play()
	body.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = .5
	timer.start()
	
func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
