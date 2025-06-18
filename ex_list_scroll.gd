extends ScrollContainer

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var last = $ExList.get_child_count()-1
	ensure_control_visible($ExList.get_child(last))
