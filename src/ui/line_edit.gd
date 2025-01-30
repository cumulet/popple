extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _save_name() -> void:
	ScoreManager.player_name = text
	print(ScoreManager.player_name)
