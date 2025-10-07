extends Node2D

@onready var loja: CanvasLayer = $loja
@onready var wavemaganer: Node = $wavemaganer
@onready var wave_numero: Label = $Ui/waveNumero

var batalhando = false


func _on_wavemaganer_num_fase(numero: int) -> void:
	batalhando = true
	#loja.mostrarBotao()
	wave_numero.text = "Wave: "+ str(numero)


func _on_spawn_manager_batalha_vencida() -> void:
	batalhando = false
	loja.mostrarBotao()


func _on_loja_confirmado() -> void:
	wavemaganer._iniciarProximaWave()


func _on_tempo_fase_timeout() -> void:
	print("perdi")
