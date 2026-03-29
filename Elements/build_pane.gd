extends Node2D


func _on_button_pressed() -> void:
	var main = get_node("/root/Main")
	var sett = main.get_node(main.current_sett)
	
	var impr =  Improvement.new()
	impr.type = "Well"
	impr.desc = "The well grants access to clean water, increasing sanitation"
	impr.workers = 12
	impr.upkeep = 30
	impr.sanitation = 100
	impr.build_time = 3
	impr.food_production[0] = 5
	impr.food_production[1] = 5
	impr.id = sett.impr.size()
	
	sett.impr.append(impr)
	
	#sett.improvements.append("Well")
	sett.reload_stats()
	main._on_construction_button_pressed()
	visible = false


func _on_button_2_pressed() -> void:
	visible = false
