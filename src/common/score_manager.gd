extends Node


signal start_game
signal score_updated(_new_score)
signal leaderboard_score_updated(_new_current_scores: Array[float])

var current_scores: Array[float]

var current_hit: int = 0:
	set(new_value):
		if new_value == 2:
			multiplier += 1
		elif new_value == 6:
			multiplier += 1
		elif new_value == 10:
			multiplier += 1
		elif new_value == 16:
			multiplier += 1
		elif new_value == 20:
			multiplier +=1
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
	start_game.connect(_on_start_game)

func add_score(_new_score: float):
	current_scores.append(_new_score)
	current_scores.sort()
	current_scores.reverse()
	leaderboard_score_updated.emit(current_scores)

func _on_start_game():
	points = 0.0
	current_hit = 0
	multiplier = 1
	score_updated.emit(points)
