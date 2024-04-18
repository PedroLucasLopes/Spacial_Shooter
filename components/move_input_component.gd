class_name MoveInputComponent
extends Node

@export var move_stats: MoveStats
@export var move_component: MoveComponent

func _input(event):
	var input_axis = Input.get_axis("ui_left", "ui_right")
	var input_axis_up_down = Input.get_axis("ui_up", "ui_down")
	move_component.velocity = Vector2(input_axis * move_stats.speed, input_axis_up_down * move_stats.speed)
