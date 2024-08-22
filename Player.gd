class_name Player
extends CharacterBody2D

@export var inputCima : String = "cima"
@export var inputBaixo : String = "baixo"
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(inputCima, inputBaixo)
	velocity.y = direction * SPEED
	velocity.x = 0
	move_and_slide()
