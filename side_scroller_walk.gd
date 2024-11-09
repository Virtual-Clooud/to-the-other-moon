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
signal change_tween


func ramp_up(_node):
	
	var tween = create_tween()
	tween.tween_property(self, "velocity", input*speed, 0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.play()

func fall_off(_node):
	var tween = create_tween()
	tween.tween_property(self, "velocity", Vector2.ZERO, 0.2)
	tween.play()

func _ready():
	host = $"..".host
	started.connect(ramp_up)
	ended.connect(fall_off)
	change_tween.connect(ramp_up)
func _physics_process(_delta: float) -> void:
	print(velocity)
	input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Verifica se o input mudou
	input.y = 0
	if input != previous_input:
		ramp_up(self)
		previous_input = input  # Atualiza o valor anterior
	if input != Vector2.ZERO and active == false:
		emit_signal("started", self)
		active = true
	elif input == Vector2.ZERO and active and velocity == Vector2.ZERO:
		emit_signal("ended", self)
		active = false
