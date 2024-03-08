extends Node

class_name LootTable

@export var tier_1_drop_chance: float = 0;
@export var tier_2_drop_chance: float = 0;

var rng = RandomNumberGenerator.new()
	
var tier_1_drops: Array = [
	preload("res://pickups/health_pickup.tscn")
]

func drop(drop_position: Vector2):
	var my_random_number: float = rng.randf_range(0.0, 100.0)
	
	print("drop chance: ", tier_1_drop_chance)
	print("my random: ", my_random_number)
	
	if (tier_1_drop_chance > my_random_number):
		var drop = (tier_1_drops.pick_random()).instantiate()
		print("dropping " + drop.name)
		drop.position = drop_position
		get_tree().root.add_child(drop)
