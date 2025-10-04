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
		

		batido = true
		couldown_som.start()
		
		criarSom.emit(velocidade)
		
		
		if body is TileMapLayer:
			criarParticulas.emit(caixa.position)
		elif body.is_in_group("Caixa"):
			criarParticulas.emit((caixa.position + body.position)/2)
			if velocidade < 180:
				if caixa.mass > body.mass:
					body.getDamage(caixa.mass - body.mass)
					#print("alguem sofreu dano")
		


func _on_couldown_som_timeout() -> void:
	batido = false
