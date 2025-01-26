extends Control

@export var bubble_spawner: BubbleSpawner


func _on_start_button_pressed() -> void:
	activate(false)
	bubble_spawner.spawn_bubbles(bubble_spawner.amountAtStart)


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func activate(_active: bool):
	visible = _active
