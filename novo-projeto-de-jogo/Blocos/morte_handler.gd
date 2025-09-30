extends Node

@onready var sprite: Sprite2D = $"../Sprite"

@onready var timer_queue_free: Timer = $timerQueueFree

var pontosDado: int =0

func _setarPontos(_pontos: int):
	pontosDado = _pontos

func _on_vida_morri() -> void:
	sprite.visible = false
	timer_queue_free.start(2)
	pass
	


func _on_timer_queue_free_timeout() -> void:
	queue_free()
