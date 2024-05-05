class_name Player extends CharacterBody2D

const SPEED: float = 150
const JUMP_VELOCITY: float = -300

var is_alive: bool = true
var direction: float
var can_roll: bool = true
@onready var animated_sprite = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if is_alive:
		handle_move()
		handle_jump()
		handle_flip()
		handle_roll()
	velocity.y += gravity * delta
	handle_anim()
	move_and_slide()

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$jump_sfx.play()
		velocity.y = JUMP_VELOCITY

func handle_move():
	direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

func handle_anim():
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

func handle_flip():
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

func handle_roll():
	if Input.is_action_just_pressed("roll") and can_roll and is_on_floor():
		can_roll = false
		animated_sprite.play("roll")
		velocity.x += direction * 700
		await  get_tree().create_timer(1).timeout
		can_roll = true
