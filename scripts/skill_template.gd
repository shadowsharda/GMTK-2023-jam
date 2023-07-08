extends Node2D

class_name Skill_Template

@export var power := 1
@export var cooldown_time := 0.5
@export var damage := 1.0

var skill_owner:Player = null
var on_cooldown = false

func activate_skill():
	print("An empty skill was used!!!")
	pass
	
