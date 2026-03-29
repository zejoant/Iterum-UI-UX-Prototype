extends Button

var stats : Unit

func _ready() -> void:
	var tween = get_tree().create_tween()
	disabled = true
	await tween.tween_property($ColorRect, "size:x", 0, stats.recruit_time).finished
	disabled = false

func _on_pressed() -> void:
	for i in get_parent().get_children():
		if i != self:
			i.button_pressed = false
	
	#disabled = true
	#button_pressed = true
	#pass
