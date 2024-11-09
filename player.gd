extends CharacterBody2D # ==  import NododePersonagem2D
class_name Player

@export var is_talking := false
@export var static_signal_node : StaticSignal
@export var dialogue_panel = preload("res://dialogue_panel.gd")
var dialogue : DialoguePanel
func _ready() -> void:
	#if static_signal_node != null:
		#static_signal_node.connect("dialogue_started", func(): is_talking = true)
		#static_signal_node.connect("dialogue_ended", func(): is_talking = false)
	#else:
		#pass
	dialogue = dialogue_panel.new()
	dialogue.dialogue_started.connect(func(): is_talking = true)

func _physics_process(_delta: float) -> void:
	if is_talking:
		velocity = Vector2.ZERO
	else:
		velocity = $movment.sum()

	move_and_slide()
