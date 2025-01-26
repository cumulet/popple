extends Control

@onready var points_node: VBoxContainer = $Points


func _ready() -> void:
	var points = points_node.get_children()
	for point in points:
		point.visible = false
	ScoreManager.leaderboard_score_updated.connect(_leaderboard_score_updated)

func _leaderboard_score_updated(_new_scores: Array[float]):
	for point: Label in points_node.get_children():
		print("leaderboard updated")
		print(point.get_index())
		if point.get_index() >= _new_scores.size() - 1:
			point.show()
			point.text = str(_new_scores[point.get_index()])
