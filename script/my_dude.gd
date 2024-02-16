extends CharacterBody2D

var bullet_scene = load("res://scene/bullet.tscn")

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _on_timer_timeout() -> void:
	var direction_x := Input.get_axis("ui_shoot_left", "ui_shoot_right")
	var direction_y := Input.get_axis("ui_shoot_up", "ui_shoot_down")
	var bullet_direction = Vector2(direction_x, direction_y)
	
	if (bullet_direction):
		var instance = bullet_scene.instantiate()
		instance.position = Vector2(position.x + 8, position.y + 8)
		instance.direction = Vector2(direction_x, direction_y)
		get_tree().root.add_child(instance)
