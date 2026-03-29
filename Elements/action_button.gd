extends Button

@export_enum("Build", "Recruit", "Garrison", "Center") var type = "Build"

func _ready() -> void:
	var stylebox_normal : StyleBoxTexture = get_theme_stylebox("normal").duplicate()
	var stylebox_hover : StyleBoxTexture = get_theme_stylebox("hover").duplicate()
	var stylebox_pressed : StyleBoxTexture = get_theme_stylebox("pressed").duplicate()
	
	stylebox_normal.texture = load("res://Resources/Icons/Actions/" + type + ".png")
	stylebox_hover.texture = load("res://Resources/Icons/Actions/" + type + "_hover.png")
	stylebox_pressed.texture = load("res://Resources/Icons/Actions/" + type + "_hover.png")
	add_theme_stylebox_override("normal", stylebox_normal)
	add_theme_stylebox_override("hover", stylebox_hover)
	add_theme_stylebox_override("pressed", stylebox_pressed)


func _on_pressed() -> void:
	var main = get_node("/root/Main")
	if type == "Build":
		main.get_node("BuildPane").visible = true
	elif type == "Recruit":
		main.get_node("RecruitPane").visible = true
