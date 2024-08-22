class_name Inimigo
extends CharacterBody2D

@onready var bola: CharacterBody2D = %Bola
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var direction = 0
	var dif = bola.global_position.y - global_position.y
	if(dif > 10):
		direction = 1
	elif(dif < -10):
		direction = -1
	velocity.y = direction * SPEED
	velocity.x = 0
	move_and_slide()
