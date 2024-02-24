extends ProgressBar

class_name MTDBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_by_current_and_max(current: int, max: int):
	# one value must be a float or gdscript will do integer division
	value = int(float(current)/max * 100)

func set_percent(new_value: int):
	value = new_value

func set_percent_by_float(new_value: float):
	value = int(new_value)