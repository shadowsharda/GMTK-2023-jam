extends Node2D

@export var skill_list:Array[String] = []
@export var skill_1:Skill_Template = null
@export var skill_2:Skill_Template = null
@export var skill_3:Skill_Template = null
@export var doge_skill:Skill_Template = null
@export var ultimate_skill:Skill_Template = null

func load_skills():
	var skill_counter = 0
	for name in skill_list:
		var skill:Skill_Template = await  load("res://scenes/skills/"+name+".tscn").instantiate()
		skill.skill_owner = get_parent()
		match skill.skill_type:
			skill.skill_types.BASIC:
				skill_counter+=1
				if skill_counter == 1:
					skill_1 = skill
				elif skill_counter == 2:
					skill_2 = skill
				elif skill_counter == 3:
					skill_3 = skill
				else:
					print("Cannot load any addtional skills")
			skill.skill_types.DOGE:
				if doge_skill != null:
					print("A doge skill was already loaded cannot add this as doge skill")
					continue
				doge_skill = skill
			skill.skill_types.ULITMATE:
				if doge_skill != null:
					print("An ultimate skill was already loaded cannot add this as ultimate skill")
					continue
				ultimate_skill = skill
			
		skill.skill_owner = get_parent()
		add_child(skill)

func replace_skill(skill:Skill_Template,skill_bearer:Skill_Template):
	if skill_bearer.skill_type == skill.skill_type:
		skill_bearer.queue_free()
		skill_bearer = skill
	pass
 
