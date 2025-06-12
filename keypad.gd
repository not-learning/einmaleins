extends GridContainer

@export var button_scene: PackedScene

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
	for ss in strs:
		var btn = button_scene.instantiate()
		btn.get_child(0).text = ss
		add_child(btn)

func _process(delta: float) -> void:
	pass
