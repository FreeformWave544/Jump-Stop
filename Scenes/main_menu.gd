extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/0.tscn")

var forwards := false
func _physics_process(delta: float) -> void:
	var gradient: Gradient = $Parallax2D/Sprite2D.texture.color_ramp
	var current_colors = gradient.colors 
	current_colors[1].b += 0.01 * 0.5 if forwards else -0.5
	if current_colors[1].b > 1.0 or current_colors[1].b < 0.0:
		current_colors[1].b = clamp(current_colors[1].b, 0.0, 1.0)
		forwards = !forwards
	gradient.colors = current_colors
