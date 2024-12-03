extends Node
class_name side_scroller_walk
## TODO: Implementar tweens

@export var speed := 200
@export var host : CharacterBody2D

var can_walk := true
var active := false
var input := Vector2.ZERO
var velocity := Vector2.ZERO
var final_velocity := Vector2.ZERO
var previous_input := Vector2.ZERO
signal started
signal ended
var tween = create_tween()

func ramp_up():
	tween.kill()
	tween = create_tween()
	tween.tween_property(
		self, "velocity", input*speed, 0.01).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.play()

func fall_off():
	tween.kill()
	tween = create_tween()
	tween.tween_property(
		self, "velocity", Vector2.ZERO,0.4).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.play()

func _ready():
	host = $"..".host
	#started.connect(ramp_up)
	#ended.connect(fall_off)
func _physics_process(_delta: float) -> void:
	input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Verifica se o input mudou
	if input != previous_input:
		if input == Vector2.ZERO:
			fall_off()
		else:
			ramp_up()
		previous_input = input  # Atualiza o valor anterior
	
	if input != Vector2.ZERO and active == false:
		emit_signal("started", self)
		active = true
	
	elif input == Vector2.ZERO and active and velocity == Vector2.ZERO:
		emit_signal("ended", self)
		active = false
