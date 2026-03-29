extends Control

var current_sett = "Venetia"
var settlements : Array = []
@export var units : Array[Unit] = []
var unit_count_venetia := 0
var unit_count_dubrovnik := 0
var curr_unit := -1

func _ready() -> void:
	$ListView/MenuButton.button_pressed = true
	$VenetiaMapButton.button_pressed = true
	reload_unit_list()
	add_map_unit(units[0].type)

func reload_unit_list():
	for i in range(units.size()):
		var imp = load("res://Elements/Unit.tscn").instantiate()
		imp.stats = units[i]
		imp.get_node("Type").text = units[i].type + " "
		imp.get_node("Cost").text = str(units[i].cost)
		imp.position = Vector2(34, 586.0 + i * 44)
		
		if curr_unit == i:
			imp.disabled = true
		
		$ListView/UnitList.add_child(imp)

func add_map_unit(type: String):
	var map_unit = load("res://Elements/MapUnit.tscn").instantiate()
	var map_button = get_node(current_sett + "MapButton")
	map_unit.position = map_button.position
	map_unit.position.y -= 70
	
	
	if current_sett == "Venetia":
		map_unit.position.x += unit_count_venetia*70
		unit_count_venetia += 1
	else:
		map_unit.position.x += unit_count_dubrovnik*70
		unit_count_dubrovnik += 1
	
	$MapUnitContainer.add_child(map_unit)

func reset_buttons(sett):
	sett.visible = false
	sett.get_node("SettlementImg").visible = false
	sett.get_node("SettlementView").visible = false
	sett.get_node("ConstructionView").visible = false
	sett.get_node("GarrisonView").visible = false
	
	$ListView.visible = false
	
	$Tabs/ListButton.disabled = false
	$Tabs/SettlementButton.disabled = false
	$Tabs/ConstructionButton.disabled = false
	$Tabs/GarrisonButton.disabled = false
	

func _on_list_button_pressed() -> void:
	var sett = get_node(current_sett)
	reset_buttons(sett)
	
	$ListView.visible = true
	$Tabs/ListButton.disabled = true
	
	reload_unit_list()

func _on_settlement_button_pressed() -> void:
	var sett = get_node(current_sett)
	reset_buttons(sett)
	
	sett.visible = true
	sett.get_node("SettlementImg").visible = true
	sett.get_node("SettlementView").visible = true
	$Tabs/SettlementButton.disabled = true
	

func _on_construction_button_pressed() -> void:
	var sett = get_node(current_sett)
	reset_buttons(sett)
	
	sett.visible = true
	sett.get_node("SettlementImg").visible = true
	sett.get_node("ConstructionView").visible = true
	$Tabs/ConstructionButton.disabled = true
	sett.get_node("ConstructionView/Info").visible = true

func _on_garrison_button_pressed() -> void:
	var sett = get_node(current_sett)
	reset_buttons(sett)
	
	sett.visible = true
	sett.get_node("SettlementImg").visible = true
	sett.get_node("GarrisonView").visible = true
	$Tabs/GarrisonButton.disabled = true



func _on_menu_button_pressed() -> void:
	$ListView/MenuButton.button_pressed = true
	$VenetiaMapButton.button_pressed = true
	$ListView/MenuButton2.button_pressed = false
	$DubrovnikMapButton.button_pressed = false
	
	current_sett = "Venetia"
	_on_settlement_button_pressed()

func _on_menu_button_2_pressed() -> void:
	$ListView/MenuButton.button_pressed = false
	$VenetiaMapButton.button_pressed = false
	$ListView/MenuButton2.button_pressed = true
	$DubrovnikMapButton.button_pressed = true
	
	current_sett = "Dubrovnik"
	if get_node_or_null(current_sett):
		_on_settlement_button_pressed()
