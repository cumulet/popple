extends Node

@export var audio_stream: AudioStream
@export var bus_name: String
@export var fade_in: float = 0.0

func _on_event_triggered():
	AudioManager.play_audio(audio_stream, bus_name, fade_in)
