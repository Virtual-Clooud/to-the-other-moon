extends Node2D

@export var points := 0

func reveal():
	$Control/Panel.visible = true

func victory():
	$Control/Panel.visible = false
	var pop_up_tween = create_tween()
	pop_up_tween.tween_property($Control/Label,
	"position", Vector2(-464,-400), 0.7).set_trans(
		Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	pop_up_tween.tween_property(
		$Sprite2D,"position", Vector2(0,8), 0.6).set_trans(
		Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	pop_up_tween.play()

func _ready():
	$Control/Panel.visible = false
	if $"../player".visited_clone and $"../player".visited_poly and $"../player".visited_nooo:
		reveal()

func _on_submit_pressed() -> void:
	if points == 3:victory()

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		points += 1
	else:
		points -= 1

func _on_check_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		points += 1
	else:
		points -= 1

func _on_check_button_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		points += 1
	else:
		points -= 1
