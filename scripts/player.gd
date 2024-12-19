class_name Player extends CharacterBody2D

@export var speed: float = 120
@export var jump_velocity: float = -300
@export var dash_speed: float = 300
@export var dash_duration: float = .3
@export var energy: float = 100
@export var dash_cost: float = 30

var is_alive: bool = true
var direction: float
@onready var animated_sprite = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if is_alive:
		heal_energy(delta)
		handle_move()
		handle_jump()
		handle_flip()
	velocity.y += gravity * delta
	handle_anim()
	move_and_slide()

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$jump_sfx.play()
		velocity.y = jump_velocity

func handle_move():
	direction = Input.get_axis("move_left", "move_right")
	if is_on_floor() and Input.is_action_just_pressed("roll") and $Timer.is_stopped() and energy >= dash_cost and not direction == 0:
		energy -= dash_cost
		%GameManager.energy_change.emit(energy)
		animated_sprite.play("roll")
		roll_start(dash_duration)
	var speed_velocity = dash_speed if not $Timer.is_stopped() else speed
	velocity.x = direction * speed_velocity

func handle_anim():
	if is_on_floor():
		if not $Timer.is_stopped():
			animated_sprite.play('roll')
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y <= 0:
			animated_sprite.play('jump_up')
		else:
			animated_sprite.play('jump_down')

func handle_flip():
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

func heal_energy(delta: float):
	var energy_regeneration: float = 5 * delta
	energy = min(energy + energy_regeneration, 100)
	%GameManager.energy_change.emit(energy)


func roll_start(duration: float):
	$Timer.wait_time = duration
	$Timer.start()
