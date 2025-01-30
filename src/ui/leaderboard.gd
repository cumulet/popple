extends Control

@onready var points_node: VBoxContainer = $Points
@onready var names_node: VBoxContainer = $Names

func _ready() -> void:
	for point: Label in points_node.get_children():
		point.hide()
	ScoreManager.leaderboard_score_updated.connect(_leaderboard_score_updated)

func _leaderboard_score_updated(_new_score: float):
	await Talo.players.identify("username", ScoreManager.player_name)
	var res = await Talo.leaderboards.add_entry("popple_leaderboard", _new_score)

	_write_leaderboard()
	pass
	
func _write_leaderboard():
	var res = await Talo.leaderboards.get_entries("popple_leaderboard", 0)
	var entries = res[0]
	var labels_point = points_node.get_children()
	var labels_names = names_node.get_children()
	for i in points_node.get_children().size():	
		if i < entries.size() :
			(labels_point[i] as Label).text = str(entries[i].score)
			(labels_names[i] as Label).text = str(entries[i].player_alias.identifier)
			(labels_point[i] as Label).show()
			(labels_names[i] as Label).show()
