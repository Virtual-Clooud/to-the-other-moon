extends Node2D

@export var next_level : String
var can_change := false
@export var node : StaticBody2D

func pop_up():
	self.visible = true
	can_change = true

func change_level(next_level):
	get_tree().change_scene_to_file(next_level)

func _ready() -> void:
	self.visible = false
	node.finished_talking.connect(pop_up)

func _physics_process(_delta: float) -> void:
	self.rotation += 0.005

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if can_change:
		change_level(next_level)
