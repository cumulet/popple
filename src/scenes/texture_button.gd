extends TextureButton
	
func _pressed() -> void:
	ScoreManager.start_game.emit()
	pass
