extends Node3D

@export var timer: Timer
@export var target_position: Node3D

var _initial_position: Vector3
var position_tween: Tween

func _ready() -> void:
	_initial_position = global_position
	ScoreManager.start_game.connect(_on_start_game)

func _start_disappear():
	if position_tween != null:
		position_tween.kill()
	position_tween = create_tween()
	position_tween.set_trans(Tween.TRANS_LINEAR)
	position_tween.tween_property(self, "global_position", target_position.global_position, timer.time_left)

func _on_start_game():
	global_position = _initial_position
	_start_disappear()
