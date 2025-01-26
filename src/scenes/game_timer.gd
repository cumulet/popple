extends Timer

func _ready() -> void:
	timeout.connect(_on_timeout)

func _on_timeout():
	ScoreManager.add_score(ScoreManager.points)
