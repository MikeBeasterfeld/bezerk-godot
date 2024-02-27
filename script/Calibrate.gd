extends Control

var left_stick_left_max : float = 0
var left_stick_right_max : float = 0
var left_stick_top_max : float = 0
var left_stick_bottom_max : float = 0

var left_stick_current : Vector2

var right_stick_left_max : float = 0
var right_stick_right_max : float = 0
var right_stick_top_max : float = 0
var right_stick_bottom_max : float = 0

var right_stick_current : Vector2

@onready var left_stick_current_label: Label = $"Left Stick/LeftStickCurrent"

@onready var left_stick_left_label: Label = $"Left Stick/LeftStickLeft"
@onready var left_stick_right_label: Label = $"Left Stick/LeftStickRight"
@onready var left_stick_top_label: Label = $"Left Stick/LeftStickTop"
@onready var left_stick_bottom_label: Label = $"Left Stick/LeftStickBottom"

@onready var right_stick_current_label: Label = $"Right Stick/RightStickCurrent"

@onready var right_stick_left_label: Label = $"Right Stick/RightStickLeft"
@onready var right_stick_right_label: Label = $"Right Stick/RightStickRight"
@onready var right_stick_top_label: Label = $"Right Stick/RightStickTop"
@onready var right_stick_bottom_label: Label = $"Right Stick/RightStickBottom"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	left_stick_current = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	left_stick_current_label.text = str(left_stick_current.x) + ", " + str(left_stick_current.y)
	
	if left_stick_left_max > left_stick_current.x:
		left_stick_left_max = left_stick_current.x

	if left_stick_right_max < left_stick_current.x:
		left_stick_right_max = left_stick_current.x

	if left_stick_top_max > left_stick_current.y:
		left_stick_top_max = left_stick_current.y

	if left_stick_bottom_max < left_stick_current.y:
		left_stick_bottom_max = left_stick_current.y

	left_stick_left_label.text = str(left_stick_left_max)
	left_stick_right_label.text = str(left_stick_right_max)
	left_stick_top_label.text = str(left_stick_top_max)
	left_stick_bottom_label.text = str(left_stick_bottom_max)
	
	right_stick_current = Input.get_vector("ui_shoot_left", "ui_shoot_right", "ui_shoot_up", "ui_shoot_down")
	
	right_stick_current_label.text = str(right_stick_current.x) + ", " + str(right_stick_current.y)
	
	if right_stick_left_max > right_stick_current.x:
		right_stick_left_max = right_stick_current.x

	if right_stick_right_max < right_stick_current.x:
		right_stick_right_max = right_stick_current.x

	if right_stick_top_max > right_stick_current.y:
		right_stick_top_max = right_stick_current.y

	if right_stick_bottom_max < right_stick_current.y:
		right_stick_bottom_max = right_stick_current.y

	right_stick_left_label.text = str(right_stick_left_max)
	right_stick_right_label.text = str(right_stick_right_max)
	right_stick_top_label.text = str(right_stick_top_max)
	right_stick_bottom_label.text = str(right_stick_bottom_max)
	
