extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var target:PhysicsBody2D=null

func _ready() -> void:
	$player_detector.area_entered.connect(area_entered)
	$player_detector.body_entered.connect(body_entered_function)
func area_entered(area:Area2D):
	pass
func body_entered_function(body:PhysicsBody2D):
	print("body entered is true function connected")
	target=body
