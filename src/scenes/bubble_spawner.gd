class_name BubbleSpawner
extends Node3D

signal started_spawn

const BUBBLE = preload("res://src/entities/bubble/bubble.tscn")
@onready var camera_3d: Camera3D = $"../Camera3D"

@export var spawnPosition:Node3D
@export var spawnAtStart:bool
@export var amountAtStart:int = 10

@export var game_timer: Timer

func _ready() -> void:
	if spawnAtStart:
		spawn_bubbles(amountAtStart)
	ScoreManager.start_game.connect(_on_start_game)

func spawn_bubbles(bubble_amount: int):
	for n in bubble_amount:
		spawn_bubble(spawnPosition.global_position)
	game_timer.start()
	started_spawn.emit()


func _on_popped(_bubble: Bubble):
	if randi_range(0, 10) > 1:
		spawn_bubble(spawnPosition.global_position)


func spawn_bubble(_global_position: Vector3):
	var b: Bubble = BUBBLE.instantiate()
	b.popped.connect(_on_popped.bind(b))
	add_child(b)
	b.camera_3d= camera_3d
	b.global_position = _global_position
	b.apply_force(Vector3(randf_range(-.1,.1),randf_range(.005,.1),0))


func _on_start_game():
	for bubble in get_tree().get_nodes_in_group("Bubbles"):
		bubble.queue_free()
	spawn_bubbles(amountAtStart)
