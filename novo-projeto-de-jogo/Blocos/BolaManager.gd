extends RigidBody2D

@export var CaixaResource: Caixa


#nodos alterar
@export var sprite: Sprite2D

@export var colisao: CollisionShape2D

@onready var area_clicada: Area2D = $areaClicada

@onready var particulas: Node2D = $particulas

@onready var morte_handler: Node = $morteHandler

#nodos base
@onready var vidaNodo: Node = $vida


func _ready() -> void:
	
	_setarNodos()
	var listaAlterar = [colisao, sprite,area_clicada]
	_setarTamanhos(listaAlterar)
	
	
func _setarNodos():
	morte_handler._setarPontos(CaixaResource.pontos)
	particulas.setParticulas(CaixaResource.particulasExplisao,Vector2(CaixaResource.tamanho,CaixaResource.tamanho))
	gravity_scale = CaixaResource.peso
	vidaNodo.setVida(CaixaResource.vida)
	sprite.texture = CaixaResource.sprite

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
