extends CharacterBody2D

const SPEED = 300.0

@export var speed = 50

#it’s the current movement direction of the cactus enemy.
var direction : Vector2

#direction and animation to be updated throughout game state
var new_direction = Vector2(0,1) #only move one spaces

@onready var player = get_tree().root.get_node("Gameboard/MyDude")

func _physics_process(delta: float) -> void:
	var movement = speed * direction * delta
	move_and_collide(movement)

func _on_timer_timeout() -> void:
	var player_distance = player.position - position
	direction = player_distance.normalized()

func handle_projectile() -> void:
	print("Ouch I've been shot!!!")
	queue_free()
	
