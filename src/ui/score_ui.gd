extends Control

@onready var points: Label = $Control/VBoxContainer/Points
@onready var combo: Label = $Control/VBoxContainer/Combo
@onready var multiplier: Label = $Control/VBoxContainer/Multiplier

func _ready() -> void:
	ScoreManager.score_updated.connect(_on_score_updated)

func _on_score_updated(_new_score):
	points.text = "points: " + str(_new_score)
	combo.text = "combo: " + str(ScoreManager.current_hit)
	multiplier.text = "multiplier: " + str(ScoreManager.multiplier)
