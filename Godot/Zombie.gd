extends CharacterBody2D

const SPEED = 70
var health = 5
var charmable = false

func _ready():
	if charmable == true:
		get_node("Charmable").visible = true
		get_node("Uncharmable").visible = false

func _physics_process(delta):
	var velocity = global_position.direction_to(Global.wizard_position)
	move_and_collide(velocity * SPEED * delta)

func _process(delta):
	if health < 0:
		queue_free()
		Global.kills += 1
		if charmable == true:
			#spawn a charm where dead
			pass

func _on_area_2d_area_entered(area):
	health -= 1

