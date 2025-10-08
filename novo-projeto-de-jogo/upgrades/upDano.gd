extends upgrade
class_name upDano



@export var forca: int



func escolhido():
	Player.playerClickForca += forca
	print(Player.playerClickForca)
