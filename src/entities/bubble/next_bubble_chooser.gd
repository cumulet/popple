extends Node3D

@export var bubble_spawner: BubbleSpawner

var current_bubble: Bubble:
	set(new_value):
		current_bubble = new_value
		Utils.set_albedo_in_mesh(mesh_current_bubble, Utils.get_albedo_in_mesh(current_bubble.mesh_bubble))

var next_bubble: Bubble:
	set(new_value):
		next_bubble = new_value
		Utils.set_albedo_in_mesh(mesh_next_bubble, Utils.get_albedo_in_mesh(next_bubble.mesh_bubble))


@onready var mesh_current_bubble: MeshInstance3D = $CurrentBubble/MeshCurrentBubble
@onready var mesh_next_bubble: MeshInstance3D = $NextBubble/MeshNextBubble

func _ready() -> void:
	update_bubbles_in_scene()
	choose_current_bubble()
	choose_next_bubble()

func update_bubbles_in_scene():
	for bubble: Bubble in get_tree().get_nodes_in_group("Bubbles"):
		bubble.popped.connect(_on_bubble_popped.bind(bubble))

func _on_bubble_popped(_bubble: Bubble):
	if Utils.get_albedo_in_mesh(_bubble.mesh_bubble) == Utils.get_albedo_in_mesh(current_bubble.mesh_bubble):
		print("Good job, pick the next bubble")
		current_bubble = next_bubble
		choose_next_bubble()
	else:
		print("Bad job, you didn't pick the same as the current bubble")
		choose_next_bubble()
	_bubble.queue_free()
	update_bubbles_in_scene()

func choose_current_bubble():
	current_bubble = get_tree().get_nodes_in_group("Bubbles").pick_random()

func choose_next_bubble():
	var tmp_next_bubble: Bubble = get_tree().get_nodes_in_group("Bubbles").pick_random()
	if tmp_next_bubble != current_bubble:
		next_bubble = tmp_next_bubble
	else:
		choose_next_bubble()
