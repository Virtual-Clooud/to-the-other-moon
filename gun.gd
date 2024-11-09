extends Node2D

@onready var bullet_scene := preload("res://bullet.tscn")
var active_gun := "sum"
var can_shoot := true
@export var number_list : numberlist
@export var player : CharacterBody2D
func _ready() -> void:
	player = self.get_parent()
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot_sum"):
		$sum.visible = true
		$sub.visible = false
		active_gun = "sum"
	if Input.is_action_just_released("change_number_up"):
		number_list.positional_change_number("up")
	elif Input.is_action_just_released("change_number_down"):
		number_list.positional_change_number("down")
	#if Input.is_action_just_pressed("shoot_sub"):
		#$sub.visible = true
		#$sum.visible = false
		#active_gun = "sub"
	if can_shoot:
		if Input.is_action_just_released("shoot_sum") and active_gun == "sum":
			var bullet_inst = bullet_scene.instantiate()
			bullet_inst.bullet_type = "Sum"
			bullet_inst.direction = rotation
			bullet_inst.global_position = $muzzle.global_position
			bullet_inst.dmg = number_list.current_number
			$"../..".add_child(bullet_inst)
			$sum.visible = false
			can_shoot = false
			$rof.start()
	look_at(get_global_mouse_position())


func _on_timer_timeout() -> void:
	can_shoot = true
