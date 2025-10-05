extends Node2D

@onready var loja: CanvasLayer = $loja
@onready var wavemaganer: Node = $wavemaganer


var batalhando = false


func _on_wavemaganer_num_fase(numero: int) -> void:
	batalhando = true
	loja.mostrarBotao(false)


func _on_spawn_manager_batalha_vencida() -> void:
	batalhando = false
	loja.mostrarBotao(true)


func _on_loja_confirmado() -> void:
	wavemaganer._iniciarProximaWave()
