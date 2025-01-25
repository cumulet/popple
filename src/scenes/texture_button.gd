extends TextureButton
	
func _pressed() -> void:
	ScoreManager.points = 0
	get_tree().reload_current_scene()
