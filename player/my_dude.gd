extends CharacterBody2D

var bullet_scene = load("res://projectile/bullet.tscn")
@onready var health_bar: MTDBar = $HealthBar
@onready var crosshair: Sprite2D = $Crosshair

var last_shot: float = Time.get_unix_time_from_system()

@export var move_speed: float = 300.0
@export var shoot_speed: float = 0.5
@export var max_health: int = 200
@export var health: int = 200

@export var sprite_size: int = 64

func _on_ready():
	health_bar.set_by_current_and_max(health, max_health)

func _physics_process(_delta: float) -> void:
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_speed * move_direction.normalized()

	var current_time: float = Time.get_unix_time_from_system()

	var shoot_direction = Input.get_vector("ui_shoot_left", "ui_shoot_right", "ui_shoot_up", "ui_shoot_down").normalized()
	
	if (shoot_direction != Vector2(0,0)):
		crosshair.visible = true
		crosshair.position = shoot_direction * Vector2(150, 150)
	else:
		crosshair.visible = false
	
	if(last_shot + shoot_speed < current_time):
		
		if(abs(shoot_direction.x) > 0 or abs(shoot_direction.y) > 0):
			print("shoot direction ", shoot_direction)
			print(abs(shoot_direction.x) - abs(shoot_direction.y))
			var instance = bullet_scene.instantiate()
			instance.position = position
			instance.direction = shoot_direction
			get_tree().root.add_child(instance)
			
			last_shot = current_time

	move_and_slide()

func handle_projectile(projectile) -> void:
	if(projectile.damage):
		health -= projectile.damage
		if health > max_health:
			health = max_health
		health_bar.set_by_current_and_max(health, max_health)
		print("Player health: ", health)
	
	if(health <= 0):
		print("I'm DEAD")
		get_tree().paused = true
