extends AudioStreamPlayer2D

@export var sonsPossiveisDano: Array[AudioStreamMP3]
@export var sonsPossiveisMorte: Array[AudioStreamMP3]

@export var somDiferente: AudioStreamMP3 = null


func _ready() -> void:
	pass
	
#0 = dano, 1 = morte
func setarSom(_modo: int,_volume):
	
	if _modo == 0:
		
		stream = sonsPossiveisDano.pick_random()
	elif _modo == 1:
		stream = sonsPossiveisMorte.pick_random()
	
	pitch_scale = randf_range(0.8, 1.4)
	volume_db = _volume
	await get_tree().create_timer(randf_range(0,0.05)).timeout  
	play()


func setarSomDiferente(_somDiferente:AudioStreamMP3, _volume):
	
	stream = _somDiferente
	pitch_scale = randf_range(0.8, 1.4)
	volume_db = _volume
	await get_tree().create_timer(randf_range(0,0.05)).timeout  
	play()
	

func _on_finished() -> void:
	queue_free()
