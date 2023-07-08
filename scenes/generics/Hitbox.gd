extends Area2D
class_name Hit_Box
signal hit_box_take_damage(damage)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_hit_box_take_damage(damage):
	print("Took :"+str(damage)+" damage")
	pass # Replace with function body.

