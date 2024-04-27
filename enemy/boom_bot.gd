extends CharacterBody2D

@export var speed = 150
@export var max_health : int = 50
@export var health : int = 50
@export var target : CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var health_bar: MTDBar = $HealthBar


func _ready() -> void:
	health_bar.set_by_current_and_max(health, max_health)

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	var movement = speed * direction * delta

	move_and_collide(movement)
	$BoomBotAnimation.look_at(navigation_agent_2d.get_next_path_position())
	

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

func _on_detection_box_body_entered(_body):
	%ExplodeTimer.start()
	print("Time to go boom!")
	$BoomBotAnimation.play()


func _on_explode_timer_timeout():
	for body in %HurtBox.get_overlapping_bodies():
		if(body.has_method("handle_projectile")):
			var explosion_distance : int = body.global_position.distance_to(%HurtBox.global_position)
			var damage = 100 - explosion_distance
			if damage < 0:
				damage = 2
			body.handle_projectile({"damage": damage})
	queue_free()



