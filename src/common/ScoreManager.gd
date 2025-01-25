extends Node

signal score_updated(_new_score)

var current_hit:
	set(new_value):
		if new_value == 2:
			multiplier += 1
		elif new_value == 6:
			multiplier += 1
		elif new_value == 10:
			multiplier += 1
		elif new_value == 0:
			multiplier = 1
		current_hit = new_value
		points = points + multiplier * new_value
		score_updated.emit(points)

var points: int = 0
var multiplier: int = 1

func _ready() -> void:
	score_updated.connect(func(_new_score): 
		print("score: " + str(points) + 
		"\nmultiplier " + str(multiplier) + 
		"\ncurrent_hit " + str(current_hit)) )
