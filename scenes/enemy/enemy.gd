extends CharacterBody2D

class_name Enemy

@export var speed := 3
@export var health := 300
@export var damage := 5

var is_dead:=false

func _ready():
	$hurtbox.damage = damage
	pass # Replace with function body.

func update_health(change:int):
	if health-change <= 0:
		health = 0
		is_dead = true
	else:
		health-=change
	print("HP is now "+str(health))

func _on_hit_box_hit_box_take_damage(damage:int):
	update_health(damage)
	pass # Replace with function body.
