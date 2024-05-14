extends ParallaxBackground

@export var background: Texture2D
@export var mid: Texture2D
@export var front: Texture2D

func _ready() -> void:
	$Background.texture = background
	if mid != null:
		$Mid/Sprite2D.texture = mid
	if front != null:
		$Front/Sprite2D.texture = front
