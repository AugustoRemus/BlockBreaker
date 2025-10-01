extends RigidBody2D

@export var CaixaResource: Caixa

#nodos alterar
@export var sprite: Sprite2D

@export var colisao: CollisionShape2D

@export var area_clicada: Area2D 

@export var particulas: Node2D 

@export var morte_handler: Node 

@export var rag_dol: Node

#nodos base
@export var vidaNodo: Node 


@export var player: Node2D


signal morri()

#se pa trocar por um init
#para debug na fase

func _ready() -> void:
	if CaixaResource:
		_setarNodos()
		var listaAlterar = [colisao, sprite,area_clicada]
		_setarTamanhos(listaAlterar)
	
	
	
	

func setCaixa(caixaBase: Caixa, _player: Node2D):
	
	#caixa e players passados na hora q começa o jogo
	CaixaResource = caixaBase.duplicate()
	player = _player
	
	_setarNodos()
	var listaAlterar = [colisao, sprite,area_clicada]
	_setarTamanhos(listaAlterar)
	
	
	
	
	
func _setarNodos():
	##setando pessoal
	mass = CaixaResource.peso
	
	var _newPhysicsMaterial = PhysicsMaterial.new()
	_newPhysicsMaterial.bounce = CaixaResource.elasticidade
	physics_material_override = _newPhysicsMaterial
	
	##setando nodos
	#morte
	morte_handler._setarMorteHandler(CaixaResource.pontos,player)
	#particulas
	var _vetc = Vector2(CaixaResource.tamanho,CaixaResource.tamanho)
	particulas.setParticulas(CaixaResource.particulasExplisao,_vetc)
	#vida
	vidaNodo.setVida(CaixaResource.vida)
	
	#ragDoll
	rag_dol.setIntensidade(CaixaResource.forcaClick)
	
	#o sprite seta direto daqui
	sprite.texture = CaixaResource.sprite
	


func _setarTamanhos(_listaAlterar):
	var _newScale = Vector2(CaixaResource.tamanho,CaixaResource.tamanho)
	for nodos in _listaAlterar:
		
		nodos.scale = _newScale


func getDamage(_dano: float):
	vidaNodo.getDamange(_dano)
	


func _morri() -> void:
	morri.emit()
