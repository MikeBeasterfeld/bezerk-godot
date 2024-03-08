extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Vector2(0,0))
	if(collision):
		if(collision.get_collider().has_method("handle_projectile")):
			collision.get_collider().handle_projectile({ "damage": -25 })
		queue_free()

#func set_pickup():
	#set_collision_layer_value(4, false)
	#set_collision_layer_value(5, true)
	#set_collision_mask_value(3, false)
	#set_collision_mask_value(2, true)

