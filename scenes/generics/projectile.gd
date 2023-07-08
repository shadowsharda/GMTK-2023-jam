extends Area2D

var speed:= 5.0
var bulletVelocity:Vector2 = Vector2.ZERO
# Assign the angle when th projectile is created to have it pointed and travel in the right direction
var angle:= 0.0
var damage = 30

func _ready():
	
	bulletVelocity = (speed*Vector2.RIGHT).rotated(angle)
	rotate(angle)
	pass # Replace with function body.

func _process(delta):
	position += bulletVelocity
#	$Bullet.rotation += delta
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	await get_tree().create_timer(2).timeout
	queue_free()
	pass # Replace with function body.

func _on_area_entered(area):
	if area.is_in_group("walls") or area.is_in_group("player") or area.is_in_group("enemy"):
		queue_free()

	pass # Replace with function body.
