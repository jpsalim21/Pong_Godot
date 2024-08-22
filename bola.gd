extends CharacterBody2D
class_name Bola

var velocidade = 300.0
var acrescimoVelocidade = 50
@export var velocidadeMax = 700
var direcao : Vector2 = Vector2.RIGHT :
	set(value):
		direcao = value.normalized()

func _physics_process(delta: float) -> void:
	velocity = velocidade * direcao
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	var player = body as CharacterBody2D
	if not player: return
	var dif = global_position.y - body.global_position.y
	dif = dif / 60
	direcao = Vector2(-direcao.x, dif)
	velocidade = min(velocidade + acrescimoVelocidade, velocidadeMax)

func _on_vertical_body_entered(body: Node2D) -> void:
	direcao = Vector2(direcao.x, -direcao.y)
