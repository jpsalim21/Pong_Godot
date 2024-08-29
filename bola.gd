extends CharacterBody2D
class_name Bola

var velocidade = 300.0
var acrescimoVelocidade = 50
@export var velocidadeMax = 700
var direcao : Vector2 = Vector2(-1,0.6) :
	set(value):
		direcao = value.normalized()

func _physics_process(delta: float) -> void:
	velocity = velocidade * direcao
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name, " foi oq bateu")
	var parede = body as StaticBody2D
	if parede:
		bateuNaParede()
	
	var player = body as CharacterBody2D
	if player:
		call_deferred("bateuNoPlayer", body.global_position.y)
	
func bateuNoPlayer(playerPosY : float):
	var dif = global_position.y - playerPosY
	dif = dif / 60.0
	direcao = Vector2(-direcao.x, dif)
	velocidade = min(velocidade + acrescimoVelocidade, velocidadeMax)

func bateuNaParede():
	direcao = Vector2(direcao.x, -direcao.y)
