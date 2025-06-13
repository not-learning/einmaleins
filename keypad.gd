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
	check = false
	if Input.is_action_just_pressed("kb_0"):
		ans *= 10
	if Input.is_action_just_pressed("kb_1"):
		ans = 10*ans + 1
	if Input.is_action_just_pressed("kb_2"):
		ans = 10*ans + 2
	if Input.is_action_just_pressed("kb_3"):
		ans = 10*ans + 3
	if Input.is_action_just_pressed("kb_4"):
		ans = 10*ans + 4
	if Input.is_action_just_pressed("kb_5"):
		ans = 10*ans + 5
	if Input.is_action_just_pressed("kb_6"):
		ans = 10*ans + 6
	if Input.is_action_just_pressed("kb_7"):
		ans = 10*ans + 7
	if Input.is_action_just_pressed("kb_8"):
		ans = 10*ans + 8
	if Input.is_action_just_pressed("kb_9"):
		ans = 10*ans + 9
	if Input.is_action_just_pressed("kb_erase"):
		ans /= 10
	if Input.is_action_just_pressed("kb_check"):
		check = true
	ans_upd.emit(ans, check)
