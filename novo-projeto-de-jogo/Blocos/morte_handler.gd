extends Node

@onready var caixa: RigidBody2D = $".."

@onready var sprite: Sprite2D = $"../Sprite"

@onready var timer_queue_free: Timer = $timerQueueFree

var pontosDado: int = 0
var praQuemDarOXP: Node2D

signal sumir()

func _setarMorteHandler(_pontos: int, _player:Node2D):
	pontosDado = _pontos
	praQuemDarOXP = _player

func _on_vida_morri() -> void:
	
	praQuemDarOXP.getXP(pontosDado)
	caixa.queue_free()
	pass
	
