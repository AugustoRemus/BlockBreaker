extends Node

@onready var caixa: RigidBody2D = $".."

@onready var sprite: Sprite2D = $"../Sprite"

@onready var timer_queue_free: Timer = $timerQueueFree

var pontosDado: int =0

signal sumir()

func _setarPontos(_pontos: int):
	pontosDado = _pontos

func _on_vida_morri() -> void:
	
	caixa.queue_free()
	
	#sprite.visible = false
	

	#timer_queue_free.start(0.5)
	pass
	
