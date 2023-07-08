extends CharacterBody2D

class_name Player

@export var speed = 300.0

@export var skill_list:Array[String] = []
@export var skill_1:Skill_Template = null
@export var skill_2:Skill_Template = null
@export var skill_3:Skill_Template = null
@export var doge_skill:Skill_Template = null


func _ready():
	load_skills()
	pass

func _physics_process(delta):
	movement()
	use_skill()
	pass
	
func movement():
	var direction = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")

	if direction:
		velocity = (direction * speed) 
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func load_skills():
	for name in skill_list:
		var skill = await  load("res://scenes/skills/"+name+".tscn").instantiate()
		skill.skill_owner = self
		$skills_container.add_child(skill)
		doge_skill = skill
		print("skills loaded")
 
func use_skill():
	if Input.is_action_just_pressed("Doge") and !doge_skill.on_cooldown:
		doge_skill.activate_skill()
	if Input.is_action_just_pressed("Skill_1") and !skill_1.on_cooldown:
		skill_1.activate_skill()
	if Input.is_action_just_pressed("Skill_2") and !skill_2.on_cooldown:
		skill_2.activate_skill()
	if Input.is_action_just_pressed("Skill_3") and !skill_3.on_cooldown:
		skill_3.activate_skill()
		
func _on_hitbox_area_entered(area):
	pass # Replace with function body.
