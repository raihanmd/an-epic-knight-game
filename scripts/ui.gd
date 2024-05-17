extends CanvasLayer

@export var map_label: String

func _ready() -> void:
	$MapLabel.text = map_label
