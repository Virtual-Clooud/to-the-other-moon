extends CharacterBody2D
@export var speed := 6000
@export_enum("Sum", "Sub") var bullet_type: String
var dmg := 0

var direction := 0.0
func _ready() -> void:
	match bullet_type:
		"Sum":
			modulate = Color(0,0,255)
		"Sub":
			modulate = Color(255,0,0)
			dmg = dmg * -1
func _physics_process(_delta: float) -> void:
	velocity = (Vector2.RIGHT * speed).rotated(direction)
	move_and_slide()


func _on_hit_collision_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		self.queue_free()
