extends Node

@onready var caixa: RigidBody2D = $".."

@onready var sprite: Sprite2D = $"../Sprite"

@onready var timer_queue_free: Timer = $timerQueueFree

var pontosDado: int = 0
var moedasDadas: int = 0

signal sumir()

func _setarMorteHandler(_pontos: int, _moedas: int) -> void:
	pontosDado = _pontos
	moedasDadas = _moedas

func _on_vida_morri() -> void:
	
	Player.getLoot(pontosDado,moedasDadas)
	caixa.queue_free()
	pass
	
