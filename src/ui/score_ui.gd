extends Control

@onready var points: Label = $Control/Points
@onready var multiplier: Label = $Control/Multiplier

func _ready() -> void:
	ScoreManager.score_updated.connect(_on_score_updated)

func _on_score_updated(_new_score):
	if visible == false:
		visible = true
	points.text = str(_new_score)
	multiplier.text = "x: " + str(ScoreManager.multiplier)
