extends Control

const SAVE_PATH = "user://save.cfg"

@export var game_stats: GameStats

var save_path = SAVE_PATH

@onready var score_value: Label = %ScoreValue as Label
@onready var highscore_value: Label = %HighscoreValue as Label

func _ready():
	load_highscore()
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_highscore()
	score_value.text = str(game_stats.score)
	highscore_value.text = str(game_stats.highscore)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://world.tscn")

func load_highscore():
	var config = ConfigFile.new()
	var error = config.load(save_path)
	if error != OK: return
	game_stats.highscore = config.get_value("game", "highscore")

func save_highscore():
	var config = ConfigFile.new()
	config.set_value("game", "highscore", game_stats.highscore)
	config.save(save_path)
