extends AudioStreamPlayer2D


@export var barulhosDeMorte : Array[AudioStreamMP3]


func _ready() -> void:
	
	stream = barulhosDeMorte.pick_random()
	pitch_scale = randf_range(0.8, 1.4)
	volume_db = randf_range(-3, 3)  
	play()



func _on_despawn_timeout() -> void:
	queue_free()
