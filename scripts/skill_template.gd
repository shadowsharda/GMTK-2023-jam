extends Node2D

class_name Skill_Template
signal cooldown_finished
signal cooldown_started
@export var power := 1
@export var cooldown_time := 0.5
@export var damage := 1.0

enum skill_types {BASIC,DOGE,ULITMATE,NONE}

var skill_owner:Player = null
var on_cooldown = false
@export var skill_type:= skill_types.NONE

# The core trigger for any skill.
func activate_skill():
	print("An empty skill was used!!!")
	pass
	
