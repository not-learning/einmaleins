extends Label

signal restart
signal toggle_ex_list_show(b: bool)

var ms: float
var done: bool
var ex_list_show: bool
var sandwich: Button

func _ready() -> void:
	ms = 0
	text = "0"
	done = true
	sandwich = get_node("/root/Node").find_child("Sandwich")

func _process(delta: float) -> void:
	if !done: ms += delta
	var fraction := "%.1f" % (ms - float(int(ms)))
	fraction = fraction.erase(0)
	var time := Time.get_time_string_from_unix_time(ms)
	text = time + fraction
	if ex_list_show:
		sandwich.text = "⣿⣿"
		sandwich.set("theme_override_font_sizes/font_size", 30)
	else:
		sandwich.text = "≣"
		sandwich.set("theme_override_font_sizes/font_size", 50)
#≣☰⠿⠿⣿⣿

func _on_restart_button_up() -> void:
	ms = 0
	done = false
	restart.emit()

func _on_sandwich_toggled(toggled_on: bool) -> void:
	ex_list_show = toggled_on
	toggle_ex_list_show.emit(toggled_on)
