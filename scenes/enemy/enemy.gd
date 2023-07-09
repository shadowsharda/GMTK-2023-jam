extends CharacterBody2D

@export var speed := 3
@export var health := 300
@export var damage := 5
@onready var agent = $NavigationAgent2D
enum {CHASE, ATTACK,IDLE,DEAD}
var unit_state := IDLE
var is_dead:=false


func _ready():
	pass # Replace with function body.

func update_health(change:int):
	if health-change <= 0:
		health = 0
	else:
		health-=change
	print("HP is now "+str(health))

func _process(_delta):
	state_manager()
	state_machine()

func update_pathfinding():
	agent.target_position = GlobalData.player.global_position
 
func pathfinding():
	if agent.is_navigation_finished():
		update_pathfinding()
		return Vector2.ZERO
	var dir := global_position.direction_to(agent.get_next_path_position())
	var desired_velocity := dir * speed
 
	return desired_velocity

func _on_timer_timeout():
	update_pathfinding()
	$Timer.start(0.1)
	pass # Replace with function body.

func state_manager():
	if is_dead:
		unit_state = DEAD
		return
	
	if GlobalData.player.global_position.distance_to(global_position) > 1000 :
		unit_state = IDLE
	elif GlobalData.player.global_position.distance_to(global_position) > 50:
		unit_state = CHASE
	else:
		unit_state = ATTACK
	print(unit_state)

func state_machine():
	match unit_state:
		CHASE:
			position += pathfinding()
			move_and_slide()
			pass
		ATTACK:
#			$Marker2D.look_at(target.global_position)
#			$AnimationPlayer.play("charge_fire")
			pass
		IDLE:
#			$AnimationPlayer.play("idle")
			return
		DEAD:
#			$AnimationPlayer.play("die")
#			$AnimationPlayer.playback_speed = 0.2
#			await $AnimationPlayer.animation_finished
#			queue_free()
			pass

func _on_hit_box_hit_box_take_damage(damage:int):
	update_health(damage)
	pass # Replace with function body.
