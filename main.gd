extends VBoxContainer

var ex: Label
var kp: GridContainer

func _ready() -> void:
	kp = get_node("KeypadMargin/Keypad")
	kp.ans_upd.connect(_on_ans_upd)
	ex = get_node("ExMargin/Exercise")
	ex.correct.connect(_on_correct)

func _on_ans_upd(ans: int, check: bool):
	ex.ans = ans
	ex.check = check

func _on_correct():
	kp.ans = 0
	ex.ans = 0

func _process(delta: float) -> void:
	pass
