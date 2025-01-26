extends Control
@onready var label: Label = $CenterContainer/Control/Label

func _ready() -> void:
	ScoreManager.start_game.connect(func(): visible = false)

func activate():
	visible = true
	label.text = str(ScoreManager.points)
