extends Control
@onready var label: Label = $CenterContainer/Control/Label

func activate():
	visible = true
	label.text = str(ScoreManager.points)
