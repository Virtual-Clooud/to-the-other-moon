extends StaticBody2D

@export var dialogue := [
	"O junin falo que c eu baixasse playstation2real.exe eu ia ter o playstation 2 secreto",
"Fui tapeado!"]
@export var can_talk := true
@export var static_signal_node : StaticSignal
@export var player : Player
@export var portal : Node2D
var tween = create_tween()
signal talk
signal finished_talking
## PlaceHolder pro npc emitir algo quando puder ser interagido
func activate_interact():
	tween.kill()
	tween = create_tween()
	var random_scale = randf_range(0.2,2)
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
	emit_signal("finished_talking")

func start_talking():
	emit_signal("talk")

func _ready():
	if player == null:
		player = $"../player"
		player.wanna_talk.connect(start_talking)
		$Area2D.area_entered.connect(want_to_talk)
		$dialogue_panel.dialogue_ended.connect(cannot_talk)
		finished_talking.connect(portal.pop_up)
	else:
		player.wanna_talk.connect(start_talking)
		$Area2D.area_entered.connect(want_to_talk)
		$dialogue_panel.dialogue_ended.connect(cannot_talk)
		finished_talking.connect(portal.pop_up)
