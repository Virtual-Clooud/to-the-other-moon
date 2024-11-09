extends Node
class_name numberlist

@export var number_quantity := 4
var number_list := []
var current_number := 0
@export var maxn := 9
@export var minn := 1

func sort_numbers(_mode : String):
	number_list.sort()
func define_numbers():
	while number_list.size() != number_quantity:
		var rng : int = randi_range(minn, maxn)
		if number_list.has(rng) == false:
			number_list.append(rng)
func random_change_number():
	current_number = number_list[randi_range(0, number_quantity - 1)]
	$current_number.set_text(str(current_number))
	$change_number.start()

var current_position := 0

func positional_change_number(mode: String):
	match mode:
		"up":
			if current_position == number_list.size() - 1:
				pass
				#current_position = 0
				
			else:
				current_position += 1
		"down":
			if current_position == 0:
				pass
				#current_position = 0
			else:
				current_position -= 1
	current_number = number_list[current_position]


	
func _ready() -> void:
	
	define_numbers()
	
	sort_numbers("asc")
	current_number = number_list[0]
	print(number_list)
