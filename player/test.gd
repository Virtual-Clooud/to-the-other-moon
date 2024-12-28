extends StaticBody2D

@export var dialogue := ["Porqueeeee?, porque eu fui clicar no anuncío que dizia 'Mulheres solteiras com 30 anos querendo consertar o encanamento'!",
"Agora hackearam a minha casa e estou trancado do lado de fora!"]
@export var can_talk := true
@export var static_signal_node : StaticSignal
@export var player : Player
var tween = create_tween()
signal talk
## PlaceHolder pro npc emitir algo quando puder ser interagido
func activate_interact():
	tween.kill()
	tween = create_tween()
	var random_scale = randf_range(2,2.5)
	tween.tween_property(
		self, "scale", Vector2(random_scale,random_scale), 
		0.3).set_trans(
			Tween.TRANS_BACK).set_ease(Tween.EASE_IN)

	tween.tween_property(
		self, "scale", Vector2(1,1),0.7).set_trans(
			Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

func want_to_talk(area):
	if area.is_in_group("player"):
		self.activate_interact()
		
func cannot_talk():
	can_talk = false
	$Area2D/CollisionShape2D.disabled = true

func start_talking():
	emit_signal("talk")

func _ready():
	if player == null:
		player = $"../player"
		player.wanna_talk.connect(start_talking)
		$Area2D.area_entered.connect(want_to_talk)
		$dialogue_panel.dialogue_ended.connect(cannot_talk)
	else:
		player.wanna_talk.connect(start_talking)
		$Area2D.area_entered.connect(want_to_talk)
		$dialogue_panel.dialogue_ended.connect(cannot_talk)
	
