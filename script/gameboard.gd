extends Node2D

var enemy_scene = load("res://scene/enemy.tscn")
@onready var my_dude: CharacterBody2D = $MyDude

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var instance = enemy_scene.instantiate()
	instance.position = Vector2(125, 75)
	instance.target = my_dude
	
	add_child(instance)
