extends Node2D

@export var particulasGerado: PackedScene

@export var particulasMortes: PackedScene

var spriteParticulas : Texture2D
var ScaleTeste: int


func setParticulas(_textura, scale):
	spriteParticulas = _textura
	ScaleTeste = scale.x
	

#se tiver dando lag botar cronometro
func _on_vida_dano() -> void:
	
	var _newParticula = particulasGerado.instantiate()
	_newParticula.texture = spriteParticulas
	_newParticula.position = position
	add_child(_newParticula)
	_newParticula.amount = _newParticula.amount * ScaleTeste
	_newParticula.emitting = true


func _on_vida_morri() -> void:
	var _newParticula = particulasMortes.instantiate()
	_newParticula.texture = spriteParticulas
	_newParticula.position = position
	add_child(_newParticula)
	
	_newParticula.amount = _newParticula.amount * ScaleTeste
	_newParticula.emitting = true
