extends Control

@onready var points_node: VBoxContainer = $Points


func _ready() -> void:
	for point: Label in points_node.get_children():
		point.hide()
	ScoreManager.leaderboard_score_updated.connect(_leaderboard_score_updated)

func _leaderboard_score_updated(_new_scores: Array[float]):
	pass
