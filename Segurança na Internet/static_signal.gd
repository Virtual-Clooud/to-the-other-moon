extends Node
class_name StaticSignal

signal dialogue_started
signal can_interact
signal dialogue_ended

func emit_dialogue_started():
	emit_signal("dialogue_started")
func emit_dialogue_ended():
	emit_signal("dialogue_ended")
func emit_can_interact():
	emit_signal("can_interact")
