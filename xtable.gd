extends GridContainer

@export var mult_scene: PackedScene

func _ready() -> void:
	for i in 9:
		for j in 9:
			var mul = preload("res://mult.tscn").instantiate()
			mul.get_node("Mult").text = str((i+1) * (j+1))
			add_child(mul)
	var tt := get_children()
	for i in 81:
		var a := i%9 + 1
		var b := i/9 + 1

func _process(delta: float) -> void:
	pass
