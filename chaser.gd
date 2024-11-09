extends CharacterBody2D
## Chases player
@export var life := 0
var direction
var player := CharacterBody2D
var number_list := [0,1,2,3]
var ramp_up := 1.0
var score
var timer_node
func _ready():
	#score = $"../../score_system"
	timer_node = $"../../main_timer"
	life = get_parent().health_list[
		randi_range(0,get_parent().health_list.size() - 1)]
	$Label.set_text(str(life))
	player = get_parent().player
	
func _physics_process(_delta: float) -> void:
	if abs(life) < 0:
		queue_free()
	elif abs(life) == 0:
		timer_node.subtract_time()
		queue_free()
	velocity = (self.global_position.direction_to(
		player.global_position) * 100) * ramp_up

	move_and_slide()
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		life -= area.get_parent().dmg
		$Label.set_text(str(life))
