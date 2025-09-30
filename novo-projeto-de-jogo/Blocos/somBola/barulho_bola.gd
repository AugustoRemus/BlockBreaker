extends AudioStreamPlayer2D



@export var sonsPossiveis: Array[AudioStreamMP3]



func _ready() -> void:
	
	stream = sonsPossiveis.pick_random()
	pitch_scale = randf_range(0.8, 1.4)
	volume_db = randf_range(-3, 3) 
	await get_tree().create_timer(randf_range(0,0.05)).timeout  
	play()



func _on_finished() -> void:
	queue_free()
