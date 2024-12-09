extends Node2D

@export var next_level := "res://Segurança na Internet/city.tscn"
var can_change := false
@export var node : StaticBody2D

func pop_up():
	self.visible = true
	can_change = true

func change_level():
	get_tree().change_scene_to_file(next_level)

func _ready() -> void:
	self.visible = false

func _physics_process(_delta: float) -> void:
	self.rotation += 0.005

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if can_change:
		change_level()
		if $"..".name == "Clone": 
			$"../player".visited_clone = true
		elif $"..".name == "Polystation": 
			$"../player".visited_poly = true
		else:
			$"../player".visited_nooo = true
