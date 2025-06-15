extends Button

signal send_num(num: int)
var num: int

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	pass

func _on_button_up() -> void:
	send_num.emit(num)
