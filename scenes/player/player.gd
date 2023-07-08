extends CharacterBody2D

class_name Player

@export var speed:float = 300.0
@onready var skill_manager:Node2D = $skills_manager

func _ready():
	skill_manager.load_skills()
	

func _physics_process(delta):
	movement(delta)
	use_skill()
	
func movement(delta_time:float):
	var direction = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")

	if direction:
		velocity = (direction * speed*delta_time) 
	else:
		velocity = Vector2.ZERO

	move_and_slide()
 
func use_skill():
	if Input.is_action_just_pressed("Doge") and !skill_manager.doge_skill.on_cooldown:
		skill_manager.doge_skill.activate_skill()
	if Input.is_action_just_pressed("Skill_1") and !skill_manager.skill_1.on_cooldown:
		skill_manager.skill_1.activate_skill()
	if Input.is_action_just_pressed("Skill_2") and !skill_manager.skill_2.on_cooldown:
		skill_manager.skill_2.activate_skill()
	if Input.is_action_just_pressed("Skill_3") and !skill_manager.skill_3.on_cooldown:
		skill_manager.skill_3.activate_skill()
	if Input.is_action_just_pressed("Ultimate") and !skill_manager.ultimate_skill.on_cooldown:
		skill_manager.ultimate_skill.activate_skill()
	
func _on_hitbox_area_entered(area):
	pass # Replace with function body.
