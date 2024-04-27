extends Node2D

var enemies = [preload("res://enemy/boom_bot.tscn"), preload("res://enemy/shooty_bot.tscn")]


@onready var my_dude: CharacterBody2D = $MyDude
@onready var timer: Timer = $Timer
@onready var fps: Label = $FPS
@onready var navigation_region_2d = $NavigationRegion2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	fps.text = str(Engine.get_frames_per_second()) + " FPS"

func _on_timer_timeout() -> void:
	navigation_region_2d.bake_navigation_polygon()
	
	var new_mob = (enemies.pick_random()).instantiate()
	%SpawnFollow.progress_ratio = randf()
	new_mob.global_position = %SpawnFollow.global_position
	new_mob.target = my_dude
	add_child(new_mob)
	
