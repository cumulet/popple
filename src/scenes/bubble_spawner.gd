class_name BubbleSpawner
extends Node3D

const BUBBLE = preload("res://src/entities/bubble/bubble.tscn")
@onready var camera_3d: Camera3D = $"../Camera3D"

@export var spawnPosition:Node3D
@export var spawnAtStart:bool
@export var amountAtStart:int = 10


func _ready() -> void:
	if spawnAtStart:
		spawn_bubbles(amountAtStart)

func spawn_bubbles(bubble_amount: int):
	for n in bubble_amount:
		var b = BUBBLE.instantiate()
		add_child(b)
		b.camera_3d= camera_3d
		b.global_position = spawnPosition.global_position
		b.apply_force(Vector3(randf_range(-.1,.1),randf_range(.005,.1),0))
