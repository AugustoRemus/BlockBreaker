extends Node

@export var ListaSpawn: Array[Caixa]


var waveAtual = 1

signal iniciarFase(arrayCaixas: Array[Caixa])
signal numFase(numero: int)

func _iniciarProximaWave():
	waveAtual += 1
	iniciarFase.emit(ListaSpawn)
	numFase.emit(waveAtual)
	#gerar array de caixas para spawnar
	
	
