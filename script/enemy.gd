extends CharacterBody2D

@export var speed = 300
@export var max_health : int = 50
@export var health : int = 50
@export var target : CharacterBody2D

#it’s the current movement direction of the cactus enemy.
var direction : Vector2

#direction and animation to be updated throughout game state
var new_direction = Vector2(0,1) #only move one spaces

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var health_bar: MTDBar = $HealthBar


func _ready() -> void:
	health_bar.set_by_current_and_max(health, max_health)

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()

	var movement = speed * direction * delta
	move_and_collide(movement)

func _on_timer_timeout() -> void:
	navigation_agent_2d.target_position = target.global_position

func handle_projectile(projectile) -> void:
	if(projectile.damage):
		health -= projectile.damage
		health_bar.set_by_current_and_max(health, max_health)
		print("Ouch I've been shot!!! health: ", health)
	
	if(health <= 0):
		print("Avenge me!!!")
		queue_free()
