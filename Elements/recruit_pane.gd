extends Node2D


func _on_button_pressed() -> void:
	var main = get_node("/root/Main")
	
	var unit =  Unit.new()
	unit.id = main.units.size()
	unit.type = "Peasant"
	unit.desc = "Poor guys or something idk"
	unit.workers = 50
	unit.upkeep = 0
	unit.recruit_time = 3
	unit.cost = 5
	unit.meelee = 3
	unit.ranged = 0
	unit.defence = 0
	unit.health = 50
	unit.speed = 20
	
	main.units.append(unit)
	main.add_map_unit(unit.type)
	
	main._on_list_button_pressed()
	visible = false


func _on_button_2_pressed() -> void:
	visible = false
