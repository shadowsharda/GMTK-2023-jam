extends Area2D

class_name Hurt_Box
var damage := 1


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_area_entered(area):
	if area is Hit_Box:
		area.emit_signal("hit_box_take_damage",damage)
	pass # Replace with function body.

