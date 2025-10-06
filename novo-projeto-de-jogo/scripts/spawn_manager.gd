extends Node2D

@export var ListaSpawn: Array[Caixa]

@export var YPos: float = -200
@export var minXPos: float = -200
@export var maxXPos: float = 200


const CAIXA = preload("uid://3feieucapg6y")

signal batalhaVencida()

#quantas caixas ja morreram
var caixasMortas: int = 0
var quantCaixas: int = 0



func _ready() -> void:
	#iniciar manualmente debug
	startLvl(ListaSpawn)
	pass
	#inicia a fila
	#_spawnCaixaRandom()
	
func startLvl(_arrayCaixas):
	quantCaixas = _arrayCaixas.size()
	caixasMortas = 0
	for caixa in _arrayCaixas:
		spawnCaixa(caixa, _getRandomPos())
	


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
	

func _spawnCaixaRandom():
	
	var _caixaRamdom = ListaSpawn.pick_random()
	var _randPos = _getRandomPos()
	spawnCaixa(_caixaRamdom,_randPos)
	


func caixaMorreu() ->void:

	caixasMortas += 1
	
	#_spawnCaixaRandom()
	
	if caixasMortas == quantCaixas:
		batalhaVencida.emit()
	


func _on_wavemaganer_iniciar_fase(arrayCaixas: Array[Caixa]) -> void:
	startLvl(arrayCaixas)
