extends Timer


func subtract_time():
	var new_time = abs(time_left - 5)
	stop()
	wait_time = new_time
	start()
	

func _physics_process(delta: float) -> void:
	print(wait_time," ; ", round(time_left))
	#$Panel/Label.text = str(
		#round(Engine.get_frames_drawn()/Engine.get_frames_per_second()))
	$Panel/Label.text = str(time_left)
