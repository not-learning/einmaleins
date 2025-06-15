extends GridContainer

@export var mult_scene: PackedScene

func _ready() -> void:
	for i in 9:
		for j in 9:
			var mulUp = preload("res://mult.tscn").instantiate()
			var mult = mulUp.get_node("Mult")
			mult.text = str((i+1) * (j+1))
			if i < 1 || j < 1:
				mult.set("theme_override_colors/font_color", Color.DIM_GRAY)
			add_child(mulUp)

func _set_nums() -> void:
	for i in 9:
		for j in 9:
			var mult := get_child(i*9+j).get_node("Mult")
			mult.text = str((i+1) * (j+1))
			if i > 0 && j > 0:
				mult.set("theme_override_colors/font_color", Color.WHITE)

func _process(_delta: float) -> void:
	pass
