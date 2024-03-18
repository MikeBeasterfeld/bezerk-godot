extends CharacterBody2D

class_name MTDProjectile

@export var SPEED: int = 300
@export var direction: Vector2
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _physics_process(delta: float) -> void:
	direction = direction.normalized()
	var movement = SPEED * direction * delta
	var collision = move_and_collide(movement)
	if(collision):
		print(collision)
		print(collision.get_collider())
		if(collision.get_collider().has_method("handle_projectile")):
			collision.get_collider().handle_projectile({ "damage": 25, "collision": collision })
		queue_free()

func set_enemy_projectile():
	set_collision_layer_value(4, false)
	set_collision_layer_value(5, true)
	set_collision_mask_value(3, false)
	set_collision_mask_value(2, true)

