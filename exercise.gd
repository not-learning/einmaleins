extends Label

signal correct(a: int, b: int)
signal done

var arr: Array[int]
var n: int
var ans: int
var ex: String

func _ready() -> void:
	for i in 8:
		for k in 8:
			arr.append((i + 2) * 10 + k + 2)
	arr.shuffle()

func _process(_delta: float) -> void:
	if n > 63:
		done.emit()
		text = ""
		return
	var a := arr[n] / 10
	var b := arr[n] % 10
	ex = "%d × %d = " % [a, b]
	var ss := ""
	if ans > 0: ss = str(ans)
	text = ex + ss
	if ans == a * b:
		correct.emit(a, b)
		n += 1

func _restart():
	n = 0
	arr.shuffle()
