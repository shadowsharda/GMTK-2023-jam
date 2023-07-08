extends Button
signal connect_skill
var skill:Skill_Template = null

func _ready():
	pass 

func _process(delta):
	pass

func enable_self():
	$ColorRect.visible = false
	print("Cooldown start skill is disabled for now ")
	
func disable_self():
	$ColorRect.visible = true
	print("Skill was reenabled after cooldown end")
	
	# Signals are being connected here because this node loads before it's partent, so it can't be done 
	# in the on _ready event.

func _on_connect_skill():
	if skill:
		print(skill)
		skill.cooldown_finished.connect(enable_self)
		skill.cooldown_started.connect(disable_self)
	pass 
