extends Node

@onready var caixa: RigidBody2D = $".."

@export var barulhoBola: PackedScene


#0dano 1 morte
#barulhos som
func _criarSom(_volume: float, _tipo: int):
	var _newBarulho = barulhoBola.instantiate()
	get_tree().root.add_child(_newBarulho)
	_newBarulho.position = caixa.position
	_newBarulho.setarSom(_tipo, _volume)

	


func _on_vida_dano() -> void:
	_criarSom(0,0)



	


func _on_vida_morri() -> void:
	_criarSom(0,1)




func _on_batida_handler_criar_som(forca: float) -> void:
	var vol = lerp(-20.0, 0.0, clamp(forca / 300.0, 0.0, 1.0))
	_criarSom(vol,0)
