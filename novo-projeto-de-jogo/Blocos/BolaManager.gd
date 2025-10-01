extends RigidBody2D

@export var CaixaResource: Caixa


#nodos alterar
@export var sprite: Sprite2D

@export var colisao: CollisionShape2D

@onready var area_clicada: Area2D = $areaClicada

@onready var particulas: Node2D = $particulas

@onready var morte_handler: Node = $morteHandler

@onready var rag_dol: Node = $ragDol

#nodos base
@onready var vidaNodo: Node = $vida


func _ready() -> void:
	
	_setarNodos()
	var listaAlterar = [colisao, sprite,area_clicada]
	_setarTamanhos(listaAlterar)
	
	
func _setarNodos():
	morte_handler._setarPontos(CaixaResource.pontos)
	var _vetc = Vector2(CaixaResource.tamanho,CaixaResource.tamanho)
	particulas.setParticulas(CaixaResource.particulasExplisao,_vetc)
	mass = CaixaResource.peso
	vidaNodo.setVida(CaixaResource.vida)
	sprite.texture = CaixaResource.sprite
	rag_dol.setIntensidade(CaixaResource.forcaClick)
	
	var _newPhysicsMaterial = PhysicsMaterial.new()
	_newPhysicsMaterial.bounce = CaixaResource.elasticidade
	physics_material_override = _newPhysicsMaterial

func _setarTamanhos(_listaAlterar):
	var _newScale = Vector2(CaixaResource.tamanho,CaixaResource.tamanho)
	for nodos in _listaAlterar:
		
		nodos.scale = _newScale

func getDamage(_dano: float):
	vidaNodo.getDamange(_dano)
	

func _sumir():
	queue_free()
	


func _on_morte_handler_sumir() -> void:
	_sumir()
