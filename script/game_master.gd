extends Node2D

@export var Scenes : Dictionary = {
	"Main Menu": "title_screen.tscn",
	"Level 1": "gameboard.tscn"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SwitchScene("Main Menu")

func SwitchScene(newScene: String) -> void:
	get_tree().change_scene_to_file("res://scene/" + Scenes[newScene])

func QuitGame() -> void:
	get_tree().quit()
