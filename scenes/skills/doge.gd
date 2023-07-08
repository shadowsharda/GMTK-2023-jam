extends Skill_Template


@export var base_doge_speed = 800
@export var doge_duration = 0.5
var can_doge = true
@onready var doge_timer = $doge_timer
@onready var doge_effect_timer = $doge_time

func _ready():
	doge_effect_timer
	

func activate_skill():
	doge()
	pass

func doge():
	if doge_timer.is_stopped() and doge_effect_timer.is_stopped():
		print("A dode was made")
		doge_effect_timer.start(doge_duration)
		doge_timer.start(cooldown_time)
		skill_owner.speed+=base_doge_speed
		on_cooldown = true
		emit_signal("cooldown_started")

func _on_doge_time_timeout():
	skill_owner.speed-=base_doge_speed
	pass # Replace with function body.

func _on_doge_timer_timeout():
	emit_signal("cooldown_finished")
	pass # Replace with function body.
	
func _on_cooldown_finished():
	on_cooldown = false
	pass # Replace with function body.



