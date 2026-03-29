extends Resource
class_name Improvement

@export var id := 0

@export var type := "Well"
@export var desc := "This thing does stuff mate"
@export var workers := 12
@export var upkeep := 30
@export var sanitation := 100
@export var build_time := 3

@export var food_production : Array[int] = [5, 5, 0, 0]

@export var lvl := 1
@export var paused := false
