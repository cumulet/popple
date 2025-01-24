class_name BubbleInteractor
extends RigidBody3D

@export var bubbleModel : MeshInstance3D

func _on_mouse_entered() -> void:
	print("in")

func _on_mouse_exited() -> void:
	print("out")
