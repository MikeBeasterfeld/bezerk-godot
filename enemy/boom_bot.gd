extends CharacterBody2D

@export var speed = 150
@export var max_health : int = 50
@export var health : int = 50
@export var target : CharacterBody2D

@onready var bullet_scene = load("res://projectile/bullet.tscn")
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var health_bar: MTDBar = $HealthBar
@onready var turrent: Node2D = $Turrent
@onready var projectile_source: Node2D = $Turrent/ProjectileSource


func _ready() -> void:
	health_bar.set_by_current_and_max(health, max_health)

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	var movement = speed * direction * delta
	
	var collision = move_and_collide(movement)
	if(collision):
		if(collision.get_collider().has_method("handle_projectile")):
			collision.get_collider().handle_projectile({ "damage": 25 })
			queue_free()
	turrent.look_at(navigation_agent_2d.get_next_path_position())
	

func _on_nav_update_timer_timeout() -> void:
	navigation_agent_2d.target_position = target.global_position

func handle_projectile(projectile) -> void:
	if(projectile.damage):
		health -= projectile.damage
		health_bar.set_by_current_and_max(health, max_health)
		print("Ouch I've been shot!!! health: ", health)
	
	if(health <= 0):
		print("Avenge me!!!")
		queue_free()



