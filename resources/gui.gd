extends Control

@onready var score: Label = %Score
@onready var life_one: Sprite2D = %lifeOne
@onready var life_two: Sprite2D = %lifeTwo
@onready var life_three: Sprite2D = %lifeThree
@onready var panel: Panel = $Panel
@onready var final_score: Label = %FinalScore
@onready var button: Button = %Button
@onready var game: Node2D = $".."

func _ready() -> void: 
	button.disabled = true 
	button.pressed.connect(game.restart_game); 

func _process(delta: float) -> void: 
	score.text = str(Manager.points)
	if Manager.lives >= 1: 
		life_one.visible = true 
	else: 
		life_one.visible = false

	if Manager.lives >= 2: 
		life_two.visible = true 
	else: 
		life_two.visible = false

	if Manager.lives >= 3: 
		life_three.visible = true 
	else: 
		life_three.visible = false
	
	if Manager.lives <= 0:
		panel.visible = true
		button.disabled = false
	else: 
		panel.visible = false 
		button.disabled = true
	
	final_score.text = "Final Score:\n" + str(Manager.points)
