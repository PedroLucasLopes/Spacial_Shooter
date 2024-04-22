extends Node2D

@export var GreenEnemyScene: PackedScene
@export var YellowEnemyScene: PackedScene
@export var PinkEnemyScene: PackedScene

@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var green_enemy_spawner_timer: Timer = $GreenEnemySpawnerTimer as Timer
@onready var yellow_enemy_spawner_timer: Timer = $YellowEnemySpawnerTimer as Timer
@onready var pink_enemy_spawner_timer: Timer = $PinkEnemySpawnerTimer as Timer

var margin = 8
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")

func _ready():
	green_enemy_spawner_timer.timeout.connect(handle_spawn.bind(GreenEnemyScene, green_enemy_spawner_timer))
	yellow_enemy_spawner_timer.timeout.connect(handle_spawn.bind(YellowEnemyScene, yellow_enemy_spawner_timer))
	pink_enemy_spawner_timer.timeout.connect(handle_spawn.bind(PinkEnemyScene, pink_enemy_spawner_timer))
	
func handle_spawn(enemy_scene: PackedScene, timer: Timer):
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, right_border - margin), -16))
	timer.start()
