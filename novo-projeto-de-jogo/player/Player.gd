extends Node2D

@onready var nivel_manager: Node = $NivelManager

var multXP: float = 1

var danoPlayer: float = 1
var playerInpulso: float = 500


func getXP(_tanto:int):
	if nivel_manager:
		nivel_manager._getXP(_tanto * multXP)
	else:
		print("sou apenas um script")
	
#atualiza todos os status dos nodos

func _attStatus():
	pass
	
	

#upou de nivel
func _LVL_Up(lvl: int) -> void:
	danoPlayer += 1
