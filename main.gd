extends VBoxContainer

var stopwatch: Label
var sandwich: Button
var xtable: GridContainer
var xtableChildren: Array[Node]
var ex: Label
#var exListMargin: MarginContainer
var exList: VBoxContainer
var kp: GridContainer

func _ready() -> void:
	stopwatch = find_child("Stopwatch")
	stopwatch.restart.connect(_on_restart)
	sandwich = find_child("Sandwich")
	stopwatch.toggle_ex_list_show.connect(_on_toggle_ex_list_show)
	xtable = find_child("Xtable")
	xtableChildren = xtable.get_children()
	ex = find_child("Exercise")
	ex.correct.connect(_on_correct)
	ex.done.connect(_on_done)
	#exListMargin = find_child("ExListMargin")
	exList = find_child("ExList")
	kp = find_child("Keypad")
	kp.ans_upd.connect(_on_ans_upd)

	exList._fill_ex_list(ex.arr)
	$ExListMargin.set("visible", false)

func _on_toggle_ex_list_show(b: bool):
	if b:
		#sandwich.text = "⣿"
		#sandwich.set("theme_override_font_sizes/font_size", 25)
		$ExListMargin.set("visible", true)
		$XtableMargin.set("visible", false)
	else:
		#sandwich.text = "≣"
		#sandwich.set("theme_override_font_sizes/font_size", 50)
		$ExListMargin.set("visible", false)
		$XtableMargin.set("visible", true)

func _on_ans_upd(ans: int):
	ex.ans = ans

func _on_correct(a: int, b: int):
	kp.ans = 0
	ex.ans = 0
	var i1 := 9*b + a - 10
	var xtc1 := xtableChildren[i1].get_node("Mult")
	#xtc1.text = "✓"
	xtc1.set("theme_override_colors/font_color", Color.GREEN)
	#xtc1.set("theme_override_font_sizes/font_size", 20)
	exList._remove_last()

func _on_done():
	stopwatch.done = true

func _on_restart():
	xtable._set_nums()
	ex._restart()
	exList._fill_ex_list(ex.arr)

func _process(_delta: float) -> void:
	pass
