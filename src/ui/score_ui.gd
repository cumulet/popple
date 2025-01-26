extends Control

@onready var points: Label = $Control/Points
@onready var multiplier: Label = $Control/Multiplier
@onready var animation_player: AnimationPlayer = $Control/Multiplier/AnimationPlayer

var localMul : int
func _ready() -> void:
	ScoreManager.score_updated.connect(_on_score_updated)

func _on_score_updated(_new_score):
	if visible == false:
		visible = true
	points.text = str(_new_score)
	if(ScoreManager.multiplier>1):
		if(localMul != ScoreManager.multiplier):
			animation_player.play("mu")
		localMul = ScoreManager.multiplier
		multiplier.visible = true
		multiplier.text = "x " + str(localMul)
		
	else:
		multiplier.visible = false
		localMul = 1
