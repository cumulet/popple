extends AudioStreamPlayer
var _stream: AudioStreamPlaybackInteractive

func _ready() -> void:
	ScoreManager.start_game.connect(gameMusic)
	
func menuMusic():
	_stream = get_stream_playback()
	_stream.switch_to_clip_by_name("Popple Chillchill")

func gameMusic():
	_stream = get_stream_playback()
	_stream.switch_to_clip_by_name("Popple Chill")
