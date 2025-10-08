extends CanvasLayer

#@onready var escolhas: GridContainer = $Escolhas
@onready var escolhas: GridContainer = $CenterContainer/Escolhas

@onready var abrir_loja: Button = $abrirLoja
@onready var confirmar: Button = $confirmar

var loja_aberta = false

var upgrades: Array[Control]

signal confirmado()

func _ready() -> void:
	var _upgrades = escolhas.get_children()
	for up in _upgrades:
		if up is Control:
			upgrades.append(up)
			
	
	pass

func mostrarBotao():
	abrirLoja()
	abrir_loja.visible = true
	confirmar.visible = true
	
	

func abrirLoja():
	for up in upgrades:
		up.newUpgrade()
	escolhas.botarBotoes()
	escolhas.visible = true


func _on_confirmar_pressed() -> void:
	escolhas.visible = false
	escolhas.matarBotoes()
	abrir_loja.visible = false
	confirmar.visible = false
	confirmado.emit()
