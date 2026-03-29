extends Node2D

#@export var improvements : Array[String] = []
@export var actions : Array[String] = []

@export var impr : Array[Improvement] = []

var curr_improvement : int = 0

func _ready() -> void:
	reload_stats()

func set_current_improvement(imp):
	curr_improvement = imp
	imp = impr[imp]
	$ConstructionView/Info.visible = true
	$ConstructionView/Info/Type.text = imp.type + " "
	for i in range(imp.lvl):
		$ConstructionView/Info/Type.text = $ConstructionView/Info/Type.text + "I"
	$ConstructionView/Info/Desc.text = imp.desc
	$ConstructionView/Info/Stat1.text = str(imp.workers)
	$ConstructionView/Info/Stat2.text = str(imp.upkeep, " / year")
	$ConstructionView/Info/Stat3.text = str(imp.sanitation, "%")
	
	$ConstructionView/Info/CurrLv.text = str("Lv. ", imp.lvl)
	$ConstructionView/Info/NextLv.text = str("➜  Lv. ", imp.lvl + 1)
	
	if imp.lvl == 3:
		$ConstructionView/Info/ImpUpgradeButton.disabled = true
		$ConstructionView/Info/CurrLv.text = "Max Level"
		$ConstructionView/Info/NextLv.visible = false
		$ConstructionView/Info/UpgradeCost.visible = false
		$ConstructionView/Info/UpgradeCostSprite.visible = false
	else:
		$ConstructionView/Info/ImpUpgradeButton.disabled = false
		#$ConstructionView/Info/CurrLv.visible = true
		$ConstructionView/Info/NextLv.visible = true
		$ConstructionView/Info/UpgradeCost.visible = true
		$ConstructionView/Info/UpgradeCostSprite.visible = true

func reload_stats():
	
	for i in $ConstructionView/Improvements.get_children():
		i.queue_free()
	
	for i in range(impr.size()):
		var imp = load("res://Elements/Improvement.tscn").instantiate()
		imp.stats = impr[i]
		imp.get_node("Type").text = impr[i].type + " "
		for j in range(impr[i].lvl):
			imp.get_node("Type").text = imp.get_node("Type").text + "I"
		imp.get_node("Workers").text = str(impr[i].workers)
		imp.get_node("Upkeep").text = str(impr[i].upkeep, "/year")
		#imp.type = impr[i].type
		imp.position = Vector2(34, 314.0 + i * 44)
		
		if curr_improvement == i:
			imp.button_pressed = true
		
		$ConstructionView/Improvements.add_child(imp)
	
	set_current_improvement(curr_improvement)
	
	for i in range(actions.size()):
		var button = load("res://Elements/ActionButton.tscn").instantiate()
		button.type = actions[i]
		button.position = Vector2(0, i * 71)
		$ActionButtonPane.add_child(button)

func _on_h_slider_value_changed(value: float) -> void:
	if value == 0:
		$SettlementView/Taxes/Label.text = "No Taxes"
		$SettlementView/Taxes/Sprite2D.texture = load("res://Resources/Icons/NoTaxes.png")
	elif value == 1:
		$SettlementView/Taxes/Label.text = "Low Taxes"
		$SettlementView/Taxes/Sprite2D.texture = load("res://Resources/Icons/LowTaxes.png")
	elif value == 2:
		$SettlementView/Taxes/Label.text = "Medium Taxes"
		$SettlementView/Taxes/Sprite2D.texture = load("res://Resources/Icons/MediumTaxes.png")
	elif value == 3:
		$SettlementView/Taxes/Label.text = "High Taxes"
		$SettlementView/Taxes/Sprite2D.texture = load("res://Resources/Icons/HighTaxes.png")
	elif value == 4:
		$SettlementView/Taxes/Label.text = "Very High Taxes"
		$SettlementView/Taxes/Sprite2D.texture = load("res://Resources/Icons/VeryHighTaxes.png")


func _on_h_slider_2_value_changed(value: float) -> void:
	if value == 0:
		$SettlementView/Rations/Label.text = "No Rations"
		$SettlementView/Rations/Sprite2D2.texture = load("res://Resources/Icons/NoRations.png")
	elif value == 1:
		$SettlementView/Rations/Label.text = "Quarter Rations"
		$SettlementView/Rations/Sprite2D2.texture = load("res://Resources/Icons/QuarterRations.png")
	elif value == 2:
		$SettlementView/Rations/Label.text = "Half Rations"
		$SettlementView/Rations/Sprite2D2.texture = load("res://Resources/Icons/HalfRations.png")
	elif value == 3:
		$SettlementView/Rations/Label.text = "Standard Rations"
		$SettlementView/Rations/Sprite2D2.texture = load("res://Resources/Icons/StandardRations.png")
	elif value == 4:
		$SettlementView/Rations/Label.text = "Extra Rations"
		$SettlementView/Rations/Sprite2D2.texture = load("res://Resources/Icons/ExtraRations.png")
	elif value == 5:
		$SettlementView/Rations/Label.text = "Double Rations"
		$SettlementView/Rations/Sprite2D2.texture = load("res://Resources/Icons/DoubleRations.png")

func _on_imp_upgrade_button_pressed() -> void:
	if impr[curr_improvement].lvl < 3:
		impr[curr_improvement].lvl += 1
		set_current_improvement(curr_improvement)
		reload_stats()
