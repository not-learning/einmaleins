extends GridContainer

@export var mult_scene: PackedScene

func _ready() -> void:
	for i in 9:
		for j in 9:
			var mul = mult_scene.instantiate()
			mul.get_child(0).text = str((i+1) * (j+1))
			add_child(mul)

func _process(delta: float) -> void:
	pass
