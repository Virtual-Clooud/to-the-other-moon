extends CharacterBody2D # ==  import NododePersonagem2D
class_name Player
static var visited_clone := false
static var visited_poly := false
static var visited_nooo := false

@export var is_talking := false
@export var can_talk := false

@export var static_signal_node : StaticSignal
var tween = create_tween()

signal wanna_talk

func activate_interact():
	can_talk = true
	tween.kill()
	tween = create_tween()
	
	tween.tween_property(
		$interact, "position", Vector2(-5,110), 0.5).set_trans(
			Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.set_parallel().tween_property(
		$interact, "scale", Vector2(2.0,2.0), 0.6).set_trans(
			Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)

func deactivate_interact():
	can_talk = false
	tween.kill()
	tween = create_tween()
	
	tween.tween_property(
		$interact, "position", Vector2(0, 0), 0.3).set_trans(
			Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	tween.set_parallel().tween_property(
		$interact, "scale", Vector2(0.0,0.0), 0.4).set_trans(
			Tween.TRANS_BACK).set_ease(Tween.EASE_IN)

func _physics_process(_delta: float) -> void:
	if is_talking:
		velocity = Vector2.ZERO
	else:
		velocity = $movment.sum()
		
	if Input.is_action_just_pressed("interact") and can_talk:
		emit_signal("wanna_talk")
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("interact"):
		activate_interact()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("interact"):
		deactivate_interact()
