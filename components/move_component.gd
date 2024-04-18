class_name MoveComponent
extends Node

# Variável possível de ser controlada pelo inspetor quando a classe for instanciada
@export var actor: Node2D
# Variável possível de ser controlada pelo inspetor quando a classe for instanciada
@export var velocity: Vector2

# Função responsável pela velocidade do ator na tela
func _process(delta):
	actor.translate(velocity * delta)
