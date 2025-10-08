extends GridContainer

const BOTOES_UPGRADES = preload("uid://iqgeb5g6bkrd")




func botarBotoes() -> void:
	
	for i in range(Player.playerQuantItemLoja):
		var newbotao = BOTOES_UPGRADES.instantiate()
		add_child(newbotao)
	
func matarBotoes():
	var myfilhos = get_children()
	for mybombo in myfilhos:
		mybombo.queue_free()
