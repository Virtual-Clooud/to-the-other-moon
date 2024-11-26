extends Node2D
class_name DialoguePanel

var npc
var dialogue_text
var current_dialogue := 0

var pop_up_tween

signal dialogue_started
signal dialogue_ended
signal dialogue_changed

@export var StaticSignalN : StaticSignal
@export var host := self.get_parent()

## Sinal de origem SEMPRE passará seus argumentos á função conectada
func dialogue_start():
	#self.visible = true
	pop_up_tween = create_tween()
	pop_up_tween.tween_property(
		$Panel,"position", Vector2(88,232), 0.7).set_trans(
		Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	pop_up_tween.play()
	pop_up_tween.finished.connect(emit_signal.bind("dialogue_started"))
	
	dialogue_text = host.dialogue[current_dialogue]

func on_dialogue_ended():
	pop_up_tween = create_tween()
	pop_up_tween.tween_property($Panel,"position", Vector2(80,568), 0.3).set_trans(
		Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	pop_up_tween.play()
	pop_up_tween.finished.connect(func(): self.visible = false)

	current_dialogue *= 0

func _ready() -> void:
	$Panel/RichTextLabel.set_text(host.dialogue[current_dialogue])
	self.visible = false
	self.dialogue_started.connect(StaticSignalN.emit_dialogue_started)
	self.dialogue_ended.connect(StaticSignalN.emit_dialogue_ended)
	## Precisa ser mudada para acomodar atomicidade
	host.talk.connect(func() : self.visible = true)
	host.talk.connect(dialogue_start)
	
	self.connect("dialogue_ended", on_dialogue_ended)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("change_number_up"):
		current_dialogue += 1
		if current_dialogue > host.dialogue.size() - 1:
			emit_signal("dialogue_changed")
			emit_signal("dialogue_ended")
		else:
			$Panel/RichTextLabel.set_text(host.dialogue[current_dialogue])
			emit_signal("dialogue_changed")
			
		
