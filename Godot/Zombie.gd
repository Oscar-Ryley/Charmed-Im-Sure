extends CharacterBody2D

const SPEED = 70

func _physics_process(delta):
	var velocity = global_position.direction_to(Global.wizard_position)
	move_and_collide(velocity * SPEED * delta)

func _on_rigid_body_2d_body_entered(body):
	print("zombie hit")

func _on_rigid_body_2d_body_exited(body):
	print("zombie exited")
