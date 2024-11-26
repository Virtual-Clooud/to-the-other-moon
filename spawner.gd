extends Node2D
# Periodically spawn ghost in random direction
# once ghost reach a distance of X units
# Spawn a chaser
@onready var ghost = preload("res://ghost.tscn")
@export var player := CharacterBody2D
@export var target := 10
var number_list := []
var ighost
var health_list := []
var possible_health := 0

func create_health_list():
	## Para combo [X]
	for x in range(0,4):
		possible_health =number_list[x]
		if health_list.has(possible_health) == false:
			health_list.append(number_list[x])
		## Para combo [X] + [Y]
		for y in range(0,4):
			if number_list[y] != number_list[x]: 
				possible_health =number_list[x] + number_list[y]
				if health_list.has(possible_health) == false:
					health_list.append(possible_health)
			## Para combo [X] + [Y] + [Z]
			for z in range(0,4):
				if number_list[z] != number_list[y]: 
					possible_health =number_list[x] + number_list[y] + number_list[z]
				if health_list.has(possible_health) == false:
					health_list.append(possible_health)

func create_health_list_from_target():
	## For Para soma [x] + [y]
	for HP in range(1, target):
		## Para combo HP + [X] == target
		for x in range(0, 3):
			if HP + number_list[x] == target:
				if health_list.has(HP) == false:
					health_list.append(HP)
					
		## Para combo HP + ([X] + [Y]) == target
		for x in range(0, 3):
			for y in range(0, 3):
				if HP + (number_list[x] + number_list[y]) == target:
					if health_list.has(HP) == false:
						health_list.append(HP)
						
					else:
						pass
					
		#for y in range(0,3):
			#if number_list[x] + number_list[y] < 10:
				#health_list.append(number_list[x] + number_list[y])

	### For Para soma [x] + [y] + [z]:
	#for x in range(0,3):
		#for y in range(0,3):
			#for z in range(0,3):
				#if number_list[x] + number_list[y] + number_list[z] < 10:
					#health_list.append(
						#number_list[x] + number_list[y] + number_list[z])
	#if number_list[
		#0] + number_list[1] + number_list[2] + number_list[3] < 10:
		#health_list.append(10 - (
			#number_list[0] + number_list[
				#1] + number_list[2] + number_list[3]))

func _ready() -> void:
	ighost = ghost.instantiate()
	self.add_child(ighost)
	number_list = $"../number_list".number_list
	create_health_list()

func _on_ghost_timer_timeout() -> void:
	
	for x in range(0, 1):
		ighost = ghost.instantiate()
		self.add_child(ighost)
	$ghost_timer.wait_time -= 0.05
