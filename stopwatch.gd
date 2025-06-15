extends Label

signal restart

var ms: float
var done: bool

func _ready() -> void:
	ms = 0
	text = "0"
	done = true

func _process(delta: float) -> void:
	if !done: ms += delta
	var fraction := "%.1f" % (ms - float(int(ms)))
	fraction = fraction.erase(0)
	var time := Time.get_time_string_from_unix_time(ms)
	text = time + fraction
#≣☰⠿⠿⣿⣿⸽⸽⸽⸽⸽



func _on_restart_button_up() -> void:
	ms = 0
	done = false
	restart.emit()
