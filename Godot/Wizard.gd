extends CharacterBody2D

var speed = 150

func _process(delta):
	if (Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D)):
		position.x += delta * speed
	if (Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A)):
		position.x -= delta * speed
	if (Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W)):
		position.y -= delta * speed
	if (Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S)):
		position.y += delta * speed
