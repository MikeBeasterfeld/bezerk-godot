extends CharacterBody2D

var bullet_scene = load("res://scene/bullet.tscn")

var last_shot: float = Time.get_unix_time_from_system()

@export var move_speed: float = 300.0
@export var shoot_speed: float = 0.5

@export var sprite_size = 64

func _physics_process(_delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_x:
		velocity.x = direction_x * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

	if direction_y:
		velocity.y = direction_y * move_speed
	else:
		velocity.y = move_toward(velocity.y, 0, move_speed)
	
	var current_time: float = Time.get_unix_time_from_system()
	
	if(last_shot + shoot_speed < current_time):
		var shoot_direction_x := Input.get_axis("ui_shoot_left", "ui_shoot_right")
		var shoot_direction_y := Input.get_axis("ui_shoot_up", "ui_shoot_down")
		#print(shoot_direction_x)
		#print(shoot_direction_y)
		print(shoot_direction_x + shoot_direction_y)
		
		if(abs(shoot_direction_x) + abs(shoot_direction_y) >= 0.8):
			var bullet_direction = Vector2(shoot_direction_x, shoot_direction_y)

			var instance = bullet_scene.instantiate()
			instance.position = Vector2(position.x + sprite_size/2, position.y + sprite_size/2)
			instance.direction = Vector2(shoot_direction_x, shoot_direction_y)
			get_tree().root.add_child(instance)
			
			last_shot = current_time

	move_and_slide()
