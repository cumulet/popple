extends Control

@export var bubble_spawner: BubbleSpawner



func _on_start_button_pressed() -> void:
	activate(false)
	#$Buttons/StartButton.grab_focus()
	ScoreManager.start_game.emit()
	get_tree().call_group("Props", "show")


func activate(_active: bool):
	visible = _active
