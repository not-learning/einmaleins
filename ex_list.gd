extends VBoxContainer

var _last: int
var _ar: Array[int]
var _labels: Array[Label]

func _ready() -> void:
	for i in 63:
		_labels.append(Label.new())
		_labels[i].set("size_flags_horizontal", SIZE_EXPAND_FILL)
		_labels[i].set("theme_override_font_sizes/font_size", 50)
		_labels[i].set("horizontal_alignment", ALIGNMENT_CENTER)
		add_child(_labels[i])

func _fill_ex_list(arr: Array[int]):
	_ar = arr.duplicate()
	_ar.reverse()
	_ar.resize(_ar.size() - 1)
	_last = _ar.size() - 1
	var n := 0
	for i in _ar:
		var a: int = i / 10
		var b: int = i % 10
		_labels[n].text = "%d × %d" % [a, b]
		_labels[n].set("visible", true)
		n += 1

func _remove_last():
	get_child(_last).set("visible", false)
	_last -= 1

func _process(_delta: float) -> void:
	pass
