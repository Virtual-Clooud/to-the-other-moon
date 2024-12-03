extends Node
class_name movment

@export var host := CharacterBody2D
@export var varray := []
var vsum := Vector2.ZERO

func sum():
	vsum = Vector2.ZERO
	for x in varray.size():
		vsum += varray[x].velocity

	return vsum

func _ready() -> void:
	for x in self.get_children().size():
		self.get_child(x).started.connect(func(node) : varray.append(node))
		self.get_child(x).ended.connect(func(node) : varray.erase(node))

func _physics_process(_delta: float) -> void:
	pass
