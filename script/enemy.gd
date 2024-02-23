extends CharacterBody2D

const SPEED = 300.0

@export var speed = 50
@export var target : CharacterBody2D

#it’s the current movement direction of the cactus enemy.
var direction : Vector2

#direction and animation to be updated throughout game state
var new_direction = Vector2(0,1) #only move one spaces

@onready var player = get_tree().root.get_node("Gameboard/MyDude")
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()

	var movement = speed * direction * delta
	move_and_collide(movement)

func _on_timer_timeout() -> void:
	navigation_agent_2d.target_position = target.global_position

func handle_projectile() -> void:
	print("Ouch I've been shot!!!")
	queue_free()
	
