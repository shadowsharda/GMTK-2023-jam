extends Enemy

enum {CHASE,ATTACK,IDLE,DEAD}
var unit_state := IDLE

@onready var agent = $NavigationAgent2D

func _ready():
	$hurtbox.damage = damage

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
	elif GlobalData.player.global_position.distance_to(global_position) > 15:
		unit_state = CHASE
	else:
		unit_state = ATTACK

func state_machine():
	match unit_state:
		CHASE:
			position += pathfinding()
			move_and_slide()
			pass
		ATTACK:
			$hurtbox.monitoring = false
			await get_tree().create_timer(0.6).timeout
			$hurtbox.monitoring = true
			pass
		IDLE:
			pass
		DEAD:
			queue_free()
			pass
