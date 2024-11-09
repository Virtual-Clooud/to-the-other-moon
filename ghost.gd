extends CharacterBody2D

@export var direction := 0
@export var speed := 500
@onready var chaser = preload("res://chaser.tscn")
func _ready() -> void:
	direction = randi_range(0, 3)
	velocity = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized() * speed

func _physics_process(_delta: float) -> void:
	if self.global_position.distance_to(self.get_parent().global_position) >= 1000:
		var ichaser = chaser.instantiate()
		ichaser.global_position = self.global_position
		self.get_parent().add_child(ichaser)
		queue_free()
	move_and_slide()
