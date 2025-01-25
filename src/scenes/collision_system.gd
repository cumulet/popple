extends Node3D

@export var upCollisionShape: CollisionShape3D
@export var downCollisionShape: CollisionShape3D
@export var leftCollisionShape: CollisionShape3D
@export var rightCollisionShape: CollisionShape3D

@onready var camera_3d: Camera3D = $"../Camera3D"

var screenRatio: float


func _process(delta: float) -> void:
	screenRatio = DisplayServer.screen_get_size().x/DisplayServer.screen_get_size().y
	print(screenRatio)
	upCollisionShape.global_position = camera_3d.global_position + Vector3.UP* camera_3d.size * screenRatio
