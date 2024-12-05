extends Node
class_name DialoguePortrait


@export var dialogue_panel : Node2D

func _ready() -> void:
	$Sprite2D.visible = false
	$"..".talk.connect(pop_in_portrait)
	dialogue_panel.dialogue_ended.connect(pop_out_portrait)
	dialogue_panel.dialogue_changed.connect(squeak)

func squeak():
	var squeak_tween = create_tween()
	squeak_tween.tween_property($Sprite2D,"scale", $Sprite2D.scale * 1.2, 0.15).set_trans(
		Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	squeak_tween.tween_property($Sprite2D,"scale", $Sprite2D.scale * 0.98, 0.15).set_trans(
		Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	squeak_tween.play()

func pop_in_portrait():
	$Sprite2D.visible = true
	var pop_up_tween = create_tween()
	pop_up_tween.tween_property($Sprite2D,"position", 
	Vector2(744,-24), 0.3).set_trans(
		Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	pop_up_tween.play()

func pop_out_portrait():
	var pop_up_tween = create_tween()
	pop_up_tween.tween_property($Sprite2D,"position", 
	Vector2(1535,1056), 0.4).set_trans(
		Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	pop_up_tween.play()
	pop_up_tween.finished.connect(func(): $Sprite2D.visible = false)
func _physics_process(_delta: float) -> void:
	$Sprite2D.visible = dialogue_panel.visible
