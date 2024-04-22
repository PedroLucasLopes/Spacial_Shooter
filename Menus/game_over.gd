extends Control

@export var game_stats: GameStats

@onready var score_value: Label = %ScoreValue as Label
@onready var highscore_value: Label = %HighscoreValue as Label

func _ready():
	if game_stats.score > game_stats.highscore:
		score_value.highscore = game_stats.score
	score_value.text = str(game_stats.score)
	highscore_value.text = str(game_stats.highscore)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://world.tscn")
