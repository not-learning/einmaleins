extends Label

signal correct

var a: int
var b: int
var ans: int
var check: bool
var ex: String

func _ready() -> void:
	a = randi() % 8 + 2
	b = randi() % 8 + 2

func _process(_delta: float) -> void:
	ex = "%d × %d = " % [a, b]
	text = ex + str(ans)
	if check && ans == a * b:
		a = randi() % 8 + 2
		b = randi() % 8 + 2
		correct.emit()
