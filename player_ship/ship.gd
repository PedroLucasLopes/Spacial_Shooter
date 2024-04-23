extends Node2D

@onready var right_muzzle: Marker2D = $rightMuzzle
@onready var left_muzzle: Marker2D = $leftMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $anchor/AnimatedSprite2D
@onready var flame: AnimatedSprite2D = %flame
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var variable_pitch_audio_stream_player: VariablePitchAudioStreamPlayer = $VariablePitchAudioStreamPlayer

func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)
	
	
func fire_lasers():
	variable_pitch_audio_stream_player.play_with_variance()
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()

func _process(_delta):
	animate_the_ship()
	
func animate_the_ship():
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("bank_left")
		flame.play("bank_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("bank_right")
		flame.play("bank_right")
	else:
		animated_sprite_2d.play("center")
		flame.play("center")
