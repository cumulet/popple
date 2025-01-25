extends ParticlesTriggerComponent


@export var bubble: Bubble

func _ready() -> void:
	super._ready()
	bubble.popped.connect(_on_popped.bind(bubble))

func _on_popped(_bubble: Bubble): 
	ParticlesManager._set_albedo_shader_material(particles, _bubble._color)
	ParticlesManager.emit_particles(particles, _bubble.global_position)
