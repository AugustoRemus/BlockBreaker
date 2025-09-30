extends Node

@onready var caixa: RigidBody2D = $".."

@export var barulhoDano: PackedScene

@export var barulhoMorte: PackedScene

#barulhos som
func _criarSomDano():
	var newBarulho = barulhoDano.instantiate()
	newBarulho.position =  caixa.position
	caixa.add_child(newBarulho)


func _on_vida_dano() -> void:
	_criarSomDano()


#barulhos morte

func _barulhoDeMorte():
	var _newBarulho = barulhoMorte.instantiate()
	_newBarulho.position =  caixa.position
	caixa.add_child(_newBarulho)
	
	


func _on_vida_morri() -> void:
	_barulhoDeMorte()
