extends Node

var nivelAtual: int = 0
var xp: int = 0
var xpNescessario: Array[int] = [10,15,20,30,40,50,60,70,80,90,100]


signal lvlUP(lvl:int)



func _getXP(_tanto: int):
	
	xp += (_tanto)
	
	while xp >= xpNescessario[nivelAtual]:
		nivelAtual += 1
		xp -= xpNescessario[nivelAtual]
		print("lvl up")
		print(nivelAtual)
		lvlUP.emit(nivelAtual)
