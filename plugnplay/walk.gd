extends Node
class_name walk
## TODO: Implementar tweens

@export var speed := 200
@export var host : CharacterBody2D

var can_walk := true
var active := false
var input := Vector2.ZERO
var velocity := Vector2.ZERO

signal started
signal ended

func _ready():
	host = $"..".host
	started.connect(func(_node) : active = true)

func _physics_process(delta: float) -> void:
	input = Input.get_vector("move_left",
	"move_right","move_up","move_down")
	
	if input != Vector2.ZERO and active == false:
		emit_signal("started", self)
	
	elif input == Vector2.ZERO and active:
		emit_signal("ended", self)
		active = false
	
	match active:
		true:
			velocity = input * speed
	
