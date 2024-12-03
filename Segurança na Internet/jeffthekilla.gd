extends Sprite2D


var appearing := false
@export var static_signal_node : StaticSignal

func appear():
	print("JOJO")
	var tween = create_tween()
	tween.tween_property(self, "modulate",Color(0.8,0.85,0.9,0.4), 2.3)
	tween.play()
func _ready() -> void:
	static_signal_node.dialogue_ended.connect(appear)
