extends Node2D

@export var caixasSpawnaveis: Array[Caixa]

@export var YPos: float = -200
@export var minXPos: float = -200
@export var maxXPos: float = 200


const CAIXA = preload("uid://3feieucapg6y")


#qutans caixas estao no cenario
var caixasSpawnadasVivas: int = 0
#quantas caixas ja foram spawnadas
var totalCaixasSpawnadas: int = 0
#quantas caixas ja morreram
var caixasMortas: int = 0
#maximo de caixas na areana de uma vez
var maxCaixasSpawnadas: int = 1


func _ready() -> void:
	
	#inicia a fila
	_spawnNextCaixa()


func _getRandomPos() ->Vector2:
	var _retorno = Vector2(0,0)
	_retorno.y = YPos
	_retorno.x = randf_range(minXPos,maxXPos)
	return _retorno
	
	
	
func spawnCaixa(_caixaR: Caixa,_pos:Vector2):
	
	var _newCaixa = CAIXA.instantiate()
	
	_newCaixa.setCaixa(_caixaR)
	
	_newCaixa.position = _pos
	
	_newCaixa.morri.connect(caixaMorreu)

	add_child(_newCaixa)
	
	caixasSpawnadasVivas += 1


func _spawnCaixaRandom():
	
	var _caixaRamdom = caixasSpawnaveis.pick_random()
	var _randPos = _getRandomPos()
	spawnCaixa(_caixaRamdom,_randPos)
	

func caixaMorreu() ->void:
	caixasSpawnadasVivas -=1
	caixasMortas += 1
	
	if caixasMortas == caixasSpawnaveis.size():
		print("terminou nivel!")
	
	elif !caixasSpawnadasVivas >= caixasSpawnaveis.size():
		_spawnNextCaixa()
	else:
		#espera matar todas
		pass
		
func _spawnNextCaixa():
	
	spawnCaixa(caixasSpawnaveis[totalCaixasSpawnadas],_getRandomPos())
	totalCaixasSpawnadas += 1
