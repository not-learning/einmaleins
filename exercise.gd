extends Label

signal correct(a: int, b: int)

var a: int
var b: int
var ans: int
var ex: String

func _ready() -> void:
	a = randi() % 8 + 2
	b = randi() % 8 + 2

func _process(_delta: float) -> void:
	ex = "%d × %d = " % [a, b]
	text = ex + str(ans)
	if ans == a * b:
		correct.emit(a, b)
		a = randi() % 8 + 2
		b = randi() % 8 + 2
