extends CharacterBody2D

const SPEED = 70
var health = 500

func _physics_process(delta):
	var velocity = global_position.direction_to(Global.wizard_position)
	move_and_collide(velocity * SPEED * delta)

func _process(delta):
	if health < 0:
		queue_free()
		Global.kills += 1

func _on_area_2d_area_entered(area):
	health -= 1

