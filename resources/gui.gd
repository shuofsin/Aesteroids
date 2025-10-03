extends Control

@onready var score: Label = %Score
@onready var life_one: Sprite2D = %lifeOne
@onready var life_two: Sprite2D = %lifeTwo
@onready var life_three: Sprite2D = %lifeThree
@onready var panel: Panel = $Panel

func _process(delta: float) -> void: 
	score.text = str(Game.points)
	if Game.lives >= 1: 
		life_one.visible = true 
	else: 
		life_one.visible = false

	if Game.lives >= 2: 
		life_two.visible = true 
	else: 
		life_two.visible = false

	if Game.lives >= 3: 
		life_three.visible = true 
	else: 
		life_three.visible = false
	
	if Game.lives <= 0:
		panel.visible = true
	else: 
		panel.visible = false 
