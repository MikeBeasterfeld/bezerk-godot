extends CharacterBody2D

@export var speed = 300
@export var max_health : float = 50
@export var health : float = 50
@export var target : CharacterBody2D

#it’s the current movement direction of the cactus enemy.
var direction : Vector2

#direction and animation to be updated throughout game state
var new_direction = Vector2(0,1) #only move one spaces

@onready var player = get_tree().root.get_node("Gameboard/MyDude")
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	progress_bar.value = health/max_health * 100

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()

	var movement = speed * direction * delta
	move_and_collide(movement)

func _on_timer_timeout() -> void:
	navigation_agent_2d.target_position = target.global_position

func handle_projectile(projectile) -> void:
	if(projectile.damage):
		health -= projectile.damage
		progress_bar.value = health/max_health * 100
		print(health/max_health * 100)
		print("Ouch I've been shot!!! health: ", health)
	
	if(health <= 0):
		print("Avenge me!!!")
		queue_free()
