extends VBoxContainer

var ex: Label
var kp: GridContainer
var xt: Array[Node]

func _ready() -> void:
	kp = find_child("Keypad")
	kp.ans_upd.connect(_on_ans_upd)
	ex = find_child("Exercise")
	ex.correct.connect(_on_correct)
	xt = get_node("Xtable/Xtable").get_children()

func _on_ans_upd(ans: int):
	ex.ans = ans

func _on_correct(a: int, b: int):
	kp.ans = 0
	ex.ans = 0
	var i1 := 9*b + a-10
	var i2 := 9*a + b-10
	var xt1 := xt[i1].get_node("Mult")
	xt1.text = "✓"
	xt1.set("theme_override_colors/font_color", Color.GREEN)

func _process(delta: float) -> void:
	pass
