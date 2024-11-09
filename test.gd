extends StaticBody2D

@export var dialogue := ["Porqueeeee?, porque eu fui clicar no anuncío que dizia 'Mulheres solteiras com 30 anos querendo consertar o encanamento'!",
"Agora hackearam a minha casa e estou trancado do lado de fora!"]
@export var can_talk := true

signal talk
func cannot_talk():
	can_talk = false
	$Area2D/CollisionShape2D.disabled = true
func _ready():
	$Area2D.area_entered.connect(
		func(_area): emit_signal("talk"))
	$dialogue_panel.dialogue_ended.connect(cannot_talk)
	# node.sinal.connect(função) -> toda vez que sinal for emitido executa a função
