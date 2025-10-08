extends Node2D
##nodos
@onready var nivel_manager: Node = $NivelManager
@onready var money_manager: Node = $moneyManager


##status

@export var playerClickForca: float = 1

@export var playermultXP: float = 1

@export var playerTempoExtra: float = 0

@export var playerInpulso: float = 500

@export var playerGoldExtra: int = 0

@export var playerQuantItemLoja = 3







func getLoot(_tanto:int, _quantMoedas: int):
	if nivel_manager:
		nivel_manager._getXP(_tanto * playermultXP)
	
	attDinheiro(_quantMoedas)
	
	
#atualiza todos os status dos nodos

func _attStatus():
	pass
	
#upou de nivel
func _LVL_Up(lvl: int) -> void:
	playerClickForca += 1



func getMoney(_quant: int) -> bool:
	if _quant > money_manager.dinheiro:
		return false
	return true
	

func attDinheiro(_quant: int) -> void:
	money_manager.attDinheiro(_quant)
