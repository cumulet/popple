extends Timer

func _ready() -> void:
	pass
func _on_timeout():
	ScoreManager.add_score(ScoreManager.points)
