extends Control
@onready var panel: Panel = $Panel

signal escolhido()


func _setarBotao():
	panel.size = Vector2(100,200)
	#passar um upgrade


func _on_button_pressed() -> void:
	escolhido.emit()
