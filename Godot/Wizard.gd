extends CharacterBody2D

var speed = 150

func _process(delta):
	Global.wizard_position = position
	
	if Input.is_key_pressed(KEY_D):
		position.x += delta * speed
	if Input.is_key_pressed(KEY_A):
		position.x -= delta * speed
	if Input.is_key_pressed(KEY_W):
		position.y -= delta * speed
	if Input.is_key_pressed(KEY_S):
		position.y += delta * speed
		
	if Input.is_action_pressed("ui_right"):
		pass
	if Input.is_action_pressed("ui_left"):
		pass
	if Input.is_action_pressed("ui_up"):
		pass
	if Input.is_action_pressed("ui_down"):
		pass
