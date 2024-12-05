extends Node2D


func _on_clone_2_finished_talking() -> void:
	#var pop_up_tween = create_tween()
	#pop_up_tween.tween_property(
		#$Label,"position", Vector2(-88,112), 0.7).set_trans(
		#Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	#pop_up_tween.tween_property(
		#$Sprite2D,"position", Vector2(0,416), 0.6).set_trans(
		#Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
#
	#pop_up_tween.play()
	$"../portal".pop_up()
	
