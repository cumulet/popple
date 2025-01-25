extends Node
# Remember Busses Names:
# Music
# SFX
# Ambient

const MUTE_DB := -80.0 # Muted audio player
const DEFAULT_AUDIO_DB := 0.0 # Normal volume

func play_audio(audio_stream: AudioStream, bus_name: String, duration_fade_in: float = 0.0):
	var player: AudioStreamPlayer = AudioStreamPlayer.new()
	player.stream = audio_stream
	player.bus = bus_name
	player.finished.connect(func(): player.queue_free())
	add_child(player)
	
	if duration_fade_in > 0.0:
		fade_audio_in(player, duration_fade_in)
	else:
		player.volume_db = DEFAULT_AUDIO_DB
		player.play()

func stop_audios_in_bus(
	bus_name: String,
	duration_fade_out: float = 0.0
):
	for child in get_children():
		if child is AudioStreamPlayer:
			if child.bus == bus_name:
				if duration_fade_out > 0.0:
					fade_audio_out(child, duration_fade_out)
				else:
					child.stop()


## Util ##

func fade_audio_in(player: AudioStreamPlayer, duration: float, bus_name: String = "Master") -> void:
	player.volume_db = MUTE_DB 
	player.bus = bus_name
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(player, "volume_db", DEFAULT_AUDIO_DB, duration)
	if player.playing == false:
		player.play() 

func fade_audio_out(player: AudioStreamPlayer, duration: float, _queue_free: bool = true) -> void:
	var tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(player, "volume_db", MUTE_DB, duration)
	if _queue_free:
		tween.tween_callback(func(): player.queue_free() if is_instance_valid(player) else null)
