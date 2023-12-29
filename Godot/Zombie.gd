extends CharacterBody2D

const SPEED = 70

func _physics_process(delta):
	var velocity = global_position.direction_to(Global.wizard_position)
	move_and_collide(velocity * SPEED * delta)
