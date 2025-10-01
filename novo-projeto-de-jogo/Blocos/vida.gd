extends Node

@export var labelVida: Label

var vida: float = 10
var vidaAtual : float
var _danoPlayer : float 

var vivo = true

signal dano()
signal morri()

func setVida(_vida: float):
	vidaAtual = _vida
	vida = _vida
	_attVidaLabel()
	
func getDamange(_dano: float):
	if vivo:
		vidaAtual = vidaAtual - _dano

		if vidaAtual > 0:
			_attVidaLabel()
			dano.emit()
		elif vidaAtual <= 0:
			vivo = false
			labelVida.text = ""
			morri.emit()
		

#pra caso de problemas de performace chamar so quado ele upa
func _setDanoPlayer():
	_danoPlayer = Player.danoPlayer
	

func _on_area_clicada_clicado() -> void:
	getDamange(Player.danoPlayer)


func _attVidaLabel():
		labelVida.text = str(int(vidaAtual))
