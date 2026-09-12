extends Area2D

@export var next_level: PackedScene = load("res://Scenes/main_menu.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.find_child("Sprite2D").texture.gradient.set_color(0, Color(0.349, 1.0, 0.0, 1.0))
		body.find_child("Sprite2D").texture.gradient.set_color(1, Color(0.502, 1.0, 0.0, 0.0))
		await get_tree().create_timer(0.5).timeout
		if is_inside_tree(): get_tree().change_scene_to_packed(next_level)
