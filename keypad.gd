extends GridContainer

signal ans_upd(num: int, check: bool)

@export var button_scene: PackedScene
var ans: int
var check: bool

var nums := [
	7, 8, 9,
	4, 5, 6,
	1, 2, 3,
	0, 0, 0,
]

var strs := [
	"7", "8", "9",
	"4", "5", "6",
	"1", "2", "3",
	"⌫", "0", "✓",
]

func _ready() -> void:
	for i in 12:
		var keyMarg = button_scene.instantiate()
		add_child(keyMarg)
		var btn = keyMarg.get_node("KeyNum")
		btn.text = strs[i]
		btn.num = i
		btn.send_num.connect(_on_send_num)

func _on_send_num(num: int):
	check = false
	if num == 9:
		ans /= 10
	elif num == 11:
		check = true
	else:
		ans = nums[num] + 10*ans
	ans_upd.emit(ans, check)

func _process(delta: float) -> void:
	pass
