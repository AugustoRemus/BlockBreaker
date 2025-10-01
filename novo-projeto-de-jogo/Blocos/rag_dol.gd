extends Node

@onready var caixa: RigidBody2D = $".."


var intensidade: float = 500

#teste 
func jogar_aleatorio():
	# direção aleatória unitária
	var direcao = Vector2(randf_range(-1.0, 1.0), -1).normalized()

	# força de empurrão
	caixa.apply_impulse(direcao * (intensidade + Player.playerInpulso))

	# rotação aleatória
	var torque = randf_range(-300.0, 300.0)
	caixa.apply_torque_impulse(torque)


func setIntensidade(_intensidade: float):
	intensidade = _intensidade


func _on_area_clicada_clicado() -> void:
	jogar_aleatorio()
