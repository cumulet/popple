class_name Bubble
extends RigidBody3D

const color_bubble_dictionary: = {
	"Yellow": Color.YELLOW,
	"Red": Color.RED,
	"Purple": Color.PURPLE,
	"Green": Color.GREEN
}

const size_bubble_dictionary: = {
	"Small": Vector3(0.3, 0.3, 0.3),
	"Big": Vector3(0.5, 0.5, 0.5)
}

@onready var mesh_bubble: MeshInstance3D = $MeshBubble
var screenSize = DisplayServer.window_get_size()
var target_scale: Vector3

var tween_scale: Tween
var tween_hover: Tween
var camera_3d : Camera3D
var screen_ratio: float

func _ready() -> void:
	screen_ratio = screenSize.x/screenSize.y
	scale = Vector3(0.05, 0.05, 0.05)
	target_scale = _randomize_scale()
	mesh_bubble.get_surface_override_material(0).albedo_color = _randomize_color()
	appear()

func _process(delta: float) -> void:
	print(global_position.x, camera_3d.size)
	if global_position.x > camera_3d.size-.5 || global_position.x < -camera_3d.size+.5:
		print("out")
		linear_velocity * -.9

func appear():
	if tween_scale != null:
		tween_scale.kill()
	tween_scale = create_tween()
	tween_scale.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	tween_scale.tween_property(mesh_bubble, "scale", target_scale, 0.5)

func hover(_additional_scale_factor: float = 0.0):
	if tween_hover != null:
		tween_hover.kill()
	tween_hover = create_tween()
	var additional_scale = Vector3(_additional_scale_factor, _additional_scale_factor, _additional_scale_factor)
	tween_hover.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween_hover.tween_property(mesh_bubble, "scale", mesh_bubble.scale + additional_scale, 0.3)

func _randomize_color() -> Color:
	return Utils.get_random_value_in_dictionary(color_bubble_dictionary)

func _randomize_scale() -> Vector3:
	return Utils.get_random_value_in_dictionary(size_bubble_dictionary)


func _on_trigger_area_3d_mouse_entered() -> void:
	hover(0.1)

func _on_trigger_area_3d_mouse_exited() -> void:
	hover(-0.1)
