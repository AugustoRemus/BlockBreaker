extends Node

@onready var caixa: RigidBody2D = $".."

@onready var couldown_som: Timer = $couldownSom

var batido = false

signal criarParticulas(_posicao:Vector2)
signal criarSom(forca:float)

func _on_caixa_body_entered(body: Node) -> void:
	#se player pegar dano por batida botar aqui e uma chamada pra tomar o
	#dano no nodo de vida
	#print(#caixa.)
	var velocidade = caixa.linear_velocity.length()
	#print(velocidade)
	if !batido:
	
		criarSom.emit(velocidade)
		
		batido = true
		couldown_som.start()
		if body is TileMapLayer:
			criarParticulas.emit(caixa.position)
		else:
			criarParticulas.emit((caixa.position + body.position)/2)
		


func _on_couldown_som_timeout() -> void:
	batido = false
