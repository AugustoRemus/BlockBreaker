extends CanvasLayer

@onready var escolhas: GridContainer = $Escolhas

@onready var abrir_loja: Button = $abrirLoja
@onready var confirmar: Button = $confirmar

var loja_aberta = false

signal confirmado()

func _ready() -> void:
	#abrirLoja()
	pass
	
func abrirLoja():
	escolhas.visible = true
	loja_aberta = true
	confirmar.visible = true


func _alteraLoja():
	escolhas.visible = !escolhas.visible
	loja_aberta = !loja_aberta
	confirmar.visible = !confirmar.visible


func mostrarBotao(_mostar: bool):
	abrir_loja.visible = _mostar
	confirmar.visible = _mostar
	loja_aberta = _mostar
	


func _on_abrir_loja_pressed() -> void:
	_alteraLoja()

#recebe um resource e faz a parada dele
func compraFeita():
	print("upgrade escolhido")
	


func _on_confirmar_pressed() -> void:
	confirmado.emit()
