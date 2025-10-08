extends Node
@onready var moedas: Label = $"../Moedas/moedas"


var dinheiro:int = 0


func attDinheiro(_quant: int):
	dinheiro += _quant
	moedas.text = "dinehiro: " + str(dinheiro)
	
