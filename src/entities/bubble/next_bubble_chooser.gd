extends Node3D

@export var bubble_spawner: BubbleSpawner

var current_bubble_color: Color:
	set(new_value):
		current_bubble_color = new_value
		Utils.set_albedo_in_mesh(mesh_current_bubble, current_bubble_color)
var current_bubble_size: float:
	set(new_value):
		current_bubble_size = new_value
		mesh_current_bubble.scale = Vector3(current_bubble_size, current_bubble_size, current_bubble_size)

var next_bubble_color: Color:
	set(new_value):
		next_bubble_color = new_value
		Utils.set_albedo_in_mesh(mesh_next_bubble, next_bubble_color)
var next_bubble_size: float:
	set(new_value):
		next_bubble_size = new_value
		mesh_next_bubble.scale = Vector3(next_bubble_size, next_bubble_size, next_bubble_size)

@onready var mesh_current_bubble: MeshInstance3D = $CurrentBubble/MeshCurrentBubble
@onready var mesh_next_bubble: MeshInstance3D = $NextBubble/MeshNextBubble

func _ready() -> void:
	update_bubbles_in_scene()
	choose_current_bubble()
	choose_next_bubble()

func update_bubbles_in_scene():
	for bubble: Bubble in get_tree().get_nodes_in_group("Bubbles"):
		if bubble.popped.is_connected(_on_bubble_popped) == false:
			bubble.popped.connect(_on_bubble_popped.bind(bubble))

func _on_bubble_popped(_bubble: Bubble):
	var popped_bubble_color: Color = Utils.get_albedo_in_mesh(_bubble.mesh_bubble)
	var popped_bubble_mesh_size: float = _bubble.target_scale.x
	if popped_bubble_color == current_bubble_color and popped_bubble_mesh_size == current_bubble_size:
		print("Good job")
		current_bubble_color = next_bubble_color
		current_bubble_size = next_bubble_size
		ScoreManager.current_hit += 1
	else:
		ScoreManager.current_hit = 0
	_bubble.remove_from_group("Bubbles")
	_bubble.queue_free()
	choose_next_bubble()
	update_bubbles_in_scene()

func choose_current_bubble():
	var tmp_bubble: Bubble = get_tree().get_nodes_in_group("Bubbles").pick_random()
	current_bubble_color = Utils.get_albedo_in_mesh(tmp_bubble.mesh_bubble)
	current_bubble_size = tmp_bubble.target_scale.x

func choose_next_bubble():
	while true:
		var tmp_next_bubble: Bubble = get_tree().get_nodes_in_group("Bubbles").pick_random()
		var tmp_next_color = Utils.get_albedo_in_mesh(tmp_next_bubble.mesh_bubble)
		if tmp_next_color != current_bubble_color:
			next_bubble_size = tmp_next_bubble.target_scale.x
			next_bubble_color = tmp_next_color
			break
