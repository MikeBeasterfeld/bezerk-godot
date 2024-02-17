extends CharacterBody2D


const SPEED = 300.0
@export var direction: Vector2

func _physics_process(delta: float) -> void:
	var movement = SPEED * direction * delta
	var collision = move_and_collide(movement)
	if(collision):
		if(collision.get_collider().has_method("handle_projectile")):
			collision.get_collider().handle_projectile()
		queue_free()
	
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
