extends CharacterBody2D

@export var speed = 250
@export var max_health : int = 50
@export var health : int = 50
@export var target : CharacterBody2D

@onready var bullet_scene = load("res://projectile/bullet.tscn")
@onready var loot_table: LootTable = load("res://shared/loot_table.tscn").instantiate()
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var health_bar: MTDBar = $HealthBar
@onready var turrent: Node2D = $Turrent
@onready var projectile_source: Node2D = $Turrent/ProjectileSource


func _ready() -> void:
	health_bar.set_by_current_and_max(health, max_health)
	add_child(loot_table)
	loot_table.tier_1_drop_chance = 100.0

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	var movement = speed * direction * delta
	
	move_and_collide(movement)
	turrent.look_at(target.position)

func _on_nav_update_timer_timeout() -> void:
	navigation_agent_2d.target_position = target.global_position

func handle_projectile(projectile) -> void:
	if(projectile.damage):
		health -= projectile.damage
		health_bar.set_by_current_and_max(health, max_health)
		print("Ouch I've been shot!!! health: ", health)
	
	if(health <= 0):
		loot_table.drop(position)
		print("Avenge me!!!")
		queue_free()

func _on_shooting_timer_timeout() -> void:
	var direction = to_local(target.position).normalized()

	var instance : MTDProjectile = bullet_scene.instantiate()
	instance.set_enemy_projectile()
	instance.position = projectile_source.global_position
	instance.direction = direction
	get_tree().root.add_child(instance)
