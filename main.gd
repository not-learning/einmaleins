extends VBoxContainer

var sw: Label
var xt: GridContainer
var xtc: Array[Node]
var ex: Label
var kp: GridContainer

func _ready() -> void:
	sw = find_child("Stopwatch")
	sw.restart.connect(_on_restart)
	xt = get_node("Xtable/Xtable")
	xtc = xt.get_children()
	ex = find_child("Exercise")
	ex.correct.connect(_on_correct)
	ex.done.connect(_on_done)
	kp = find_child("Keypad")
	kp.ans_upd.connect(_on_ans_upd)

func _on_ans_upd(ans: int):
	ex.ans = ans

func _on_correct(a: int, b: int):
	kp.ans = 0
	ex.ans = 0
	var i1 := 9*b + a - 10
	var xtc1 := xtc[i1].get_node("Mult")
	xtc1.text = "✓"
	xtc1.set("theme_override_colors/font_color", Color.GREEN)

func _on_done():
	sw.done = true

func _on_restart():
	xt._set_nums()
	ex._restart()

func _process(_delta: float) -> void:
	pass
