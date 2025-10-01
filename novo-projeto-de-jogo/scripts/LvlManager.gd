extends Node2D
@export var player: Node2D
@export var caixasSpawnaveis: Array[Caixa]

@export var YPos: float = -200
@export var minXPos: float = -200
@export var maxXPos: float = 200

const CAIXA = preload("uid://3feieucapg6y")

var caixasSpawnadas: int = 0


func _ready() -> void:
	_spawnCaixaRandom()
	pass



func _spawnCaixaRandom():
	
	var _caixaRamdom = caixasSpawnaveis.pick_random()
	var _randPos = _getRandomPos()
	spawnCaixa(_caixaRamdom,_randPos)
	
func _getRandomPos() ->Vector2:
	var _retorno = Vector2(0,0)
	_retorno.y = YPos
	_retorno.x = randf_range(minXPos,maxXPos)
	return _retorno
	
	
	
func spawnCaixa(_caixaR: Caixa,_pos:Vector2):
	
	var _newCaixa = CAIXA.instantiate()
	
	_newCaixa.setCaixa(_caixaR,player)
	
	_newCaixa.position = _pos
	
	_newCaixa.morri.connect(caixaMorreu)

	add_child(_newCaixa)
	
	caixasSpawnadas += 1
	
	

func caixaMorreu() ->void:
	caixasSpawnadas -=1
