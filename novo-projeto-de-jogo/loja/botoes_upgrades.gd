extends Control
@onready var panel: Panel = $Panel

@onready var nome: Label = $Panel/nome
@onready var oque_faz: RichTextLabel = $Panel/oqueFaz
@onready var preco: Label = $Panel/preco




@export var todosUpgrades: Array[upgrade]

var valor: int
var upgradeSelecionado: upgrade
signal escolhido()

func _ready() -> void:
	_setarBotao()
	
func newUpgrade():
	_setarBotao()
	
func _setarBotao():
	
	panel.size = Vector2(100,200)
	#melhorar e botar raridade
	upgradeSelecionado = todosUpgrades.pick_random()
	
	nome.text = upgradeSelecionado.nome
	oque_faz.text = upgradeSelecionado.desc
	
	valor = upgradeSelecionado.preco
	#embaralhar func
	preco.text = str(valor)
	

func _on_button_pressed() -> void:
	#testar se tem dinheiro
	if Player.getMoney(valor):
		Player.attDinheiro(-valor)
		upgradeSelecionado.escolhido()
		
		_setarBotao()
	else:
		print("ta liso chefe")
	
