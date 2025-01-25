extends Node



func emit_particles(_particles: CPUParticles3D, _global_position: Vector3):
	_particles.finished.connect(_on_particles_finished.bind(_particles))
	add_child(_particles)
	_particles.global_position = _global_position
	_particles.emitting = true

func _set_albedo_shader_material(_particles: CPUParticles3D, _albedo: Color):
	var tmp_material: ShaderMaterial = _particles.mesh.surface_get_material(0)
	tmp_material.set_shader_parameter("albedo_color", _albedo)

func _on_particles_finished(_particles: CPUParticles3D):
	_particles.queue_free()
