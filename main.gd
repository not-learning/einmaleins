extends VBoxContainer

var ex: Label
var kp: GridContainer
var xt: Array[Node]

func _ready() -> void:
	kp = get_node("KeypadMargin/Keypad")
	kp.ans_upd.connect(_on_ans_upd)
	ex = get_node("ExMargin/Exercise")
	ex.correct.connect(_on_correct)
	var a := get_node("Xtable")
	xt = a.get_child(0).get_children()

func _on_ans_upd(ans: int):
	ex.ans = ans

func _on_correct(a: int, b: int):
	kp.ans = 0
	ex.ans = 0
	var i1 := 9*b + a-10
	var i2 := 9*a + b-10
	xt[i1].get_node("Mult").text = "✓"
	xt[i2].get_node("Mult").text = "✓"

func _process(delta: float) -> void:
	pass
