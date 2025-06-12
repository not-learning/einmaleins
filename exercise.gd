extends Label

func _ready() -> void:
	var a := randi() % 8 + 2
	var b := randi() % 8 + 2
	var ex := "%d × %d = " % [a, b]
	text = ex

func _process(_delta: float) -> void:
	pass # Replace with function body.
