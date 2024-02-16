extends CharacterBody2D


const SPEED = 300.0
@export var direction: Vector2

var free_next_tick: bool = false

func _physics_process(delta: float) -> void:
	var movement = SPEED * direction * delta
	var collision = move_and_collide(movement)
	if(collision):
		print(collision.get_collider().name)
		if(free_next_tick):
			queue_free()
		free_next_tick = true
	
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
