extends Area2D
@warning_ignore("unused_parameter")
signal clicado()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			clicado.emit()
			#print("me clicaram")
