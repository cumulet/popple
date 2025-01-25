extends Node
class_name ParticlesTriggerComponent

@export var particles_scene: PackedScene
@export var target_position: Node3D

var particles: CPUParticles3D


func _ready() -> void:
	particles = particles_scene.instantiate()

func _on_event_triggered():
	ParticlesManager.emit_particles(particles, target_position.global_position)
