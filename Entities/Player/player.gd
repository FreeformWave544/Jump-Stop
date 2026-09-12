extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var pause := false
func _physics_process(delta: float) -> void:
	if pause: return
	if not is_on_floor(): velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor(): velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("STOP"):
		var gradient = $Sprite2D.texture.gradient
		gradient.set_color(0, Color(0.35, 0.0, 0.0, 1.0))
		gradient.set_color(1, Color(0.5, 0.0, 0.0, 0.0))
		velocity = Vector2.ZERO
		pause = true
		await get_tree().create_timer(0.2).timeout
		pause = false
		for i in range(35):
			gradient.set_color(0, gradient.get_color(0) - Color(0.01, 0, 0, 0))
			gradient.set_color(1, gradient.get_color(1) - Color(0.01, 0, 0, 0))
			if is_inside_tree(): await get_tree().process_frame
	var direction := Input.get_axis("left", "right")
	if direction: velocity.x = direction * SPEED
	else: velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
