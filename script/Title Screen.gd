extends Node2D

@onready var selector: Node2D = $Selector

var selector_start_y: int = 0
var selector_move_distance: int = 73
var released : bool = true
var option_size : int = 2
var option_selected : int = 1

func _ready():
	selector_start_y = selector.position.y

func _process(delta: float) -> void:
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	if (released and move_direction.y != 0):
		released = false
		print(move_direction)
		if move_direction.y > 0:
			if (option_selected == option_size):
				option_selected = 1
			else:
				option_selected += 1
		if move_direction.y < 0:
			if (option_selected == 1):
				option_selected = option_size
			else:
				option_selected -= 1
				
		selector.position.y = selector_start_y + ((option_selected - 1) * selector_move_distance)
	
	if (move_direction.x == 0):
		released = true
		
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if option_selected == 1:
			GameMaster.SwitchScene("Level 1")
		if option_selected == 2:
			GameMaster.QuitGame()
