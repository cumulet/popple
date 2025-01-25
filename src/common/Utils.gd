extends Node

func get_random_value_in_dictionary(_dictionary: Dictionary):
	var size = _dictionary.size()
	var random_key = _dictionary.keys()[randi() % size]
	var value = _dictionary[random_key]
	return value

func get_albedo_in_mesh(_mesh: MeshInstance3D) -> Color:
	var tmp_material: StandardMaterial3D = _mesh.get_surface_override_material(0)
	return tmp_material.albedo_color

func set_albedo_in_mesh(_mesh: MeshInstance3D, _color: Color):
	var tmp_material: StandardMaterial3D = _mesh.get_surface_override_material(0)
	tmp_material.albedo_color = _color

func get_custom_albedo_in_mesh(_mesh: MeshInstance3D) -> Color:
	var tmp_material: ShaderMaterial = _mesh.get_surface_override_material(0)
	return tmp_material.get_shader_parameter("albedo_color")

func set_custom_albedo_in_mesh(_mesh: MeshInstance3D, _color: Color):
	var tmp_material: ShaderMaterial = _mesh.get_surface_override_material(0)
	tmp_material.set_shader_parameter("albedo_color", _color)
