extends Control

var speed = 4

func _ready() -> void:
	get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = true

func _on_minus_button_pressed() -> void:
	if speed > 1:
		get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = false
		speed -= 1
		get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = true

func _on_speed_button_pressed(source: BaseButton) -> void:
	get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = false
	speed = source.text
	get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = true

func _on_plus_button_pressed() -> void:
	if speed < 7:
		get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = false
		speed += 1
		get_node("SpeedPanel/SpeedButtons/Speed" + str(speed)).button_pressed = true

func _on_play_button_pressed() -> void:
	pass # Replace with function body.
