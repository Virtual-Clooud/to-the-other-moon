extends Node2D

@export var points := 0

func reveal():
	return
func rate():
	return
func victory():
	return
func lost():
	return


func _on_submit_pressed() -> void:
	rate()
	if points == 3:victory()
	else:lost()
