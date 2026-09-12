extends Area2D

@onready var next_level: PackedScene = load(get_tree().current_scene.scene_file_path.split(get_tree().current_scene.scene_file_path[-6])[0]  + str(int(get_tree().current_scene.scene_file_path[-6]) + 1) + ".tscn")
func _on_body_entered(body: Node2D) -> void:
	print(get_tree().current_scene.scene_file_path)
	if body is Player:
		body.find_child("Sprite2D").texture.gradient.set_color(0, Color(0.349, 1.0, 0.0, 1.0))
		body.find_child("Sprite2D").texture.gradient.set_color(1, Color(0.502, 1.0, 0.0, 0.0))
		await get_tree().create_timer(0.5).timeout
		if is_inside_tree(): get_tree().change_scene_to_packed(next_level if (next_level and ResourceLoader.exists(next_level.resource_path)) else load("res://Scenes/main_menu.tscn"))
