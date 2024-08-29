extends Node

var pont1 : int = 0
var pont2 : int = 0
@onready var label1: Label = $"../CanvasLayer/Label"
@onready var label2: Label = $"../CanvasLayer/Label2"
@onready var bola: Bola = %Bola

func _on_area_2d_body_entered(body: Node2D) -> void:
	var b = body as CharacterBody2D
	if not b: return
	pont1+=1
	label1.text = str(pont1)
	resetaBola(Vector2.RIGHT)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	print(body.name)
	var b = body as CharacterBody2D
	if not b: return
	pont2+=1
	label2.text = str(pont2)
	resetaBola(Vector2.LEFT)

func resetaBola(dir : Vector2):
	await get_tree().create_timer(1).timeout
	bola.global_position = Vector2.ZERO
	bola.direcao = dir
	bola.velocidade = 300
