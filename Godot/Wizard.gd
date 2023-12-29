extends CharacterBody2D

const bulletpath = preload("res://Godot/Charm.tscn")

var speed = 150

func _process(delta):
	Global.wizard_position = position - Vector2(681,362)
	
	if Input.is_key_pressed(KEY_D):
		position.x += delta * speed
	if Input.is_key_pressed(KEY_A):
		position.x -= delta * speed
	if Input.is_key_pressed(KEY_W):
		position.y -= delta * speed
	if Input.is_key_pressed(KEY_S):
		position.y += delta * speed

	if Input.is_action_pressed("ui_up"):
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		bullet.movement = Vector2(0, -7)
	
	if Input.is_action_pressed("ui_down"):
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		bullet.movement = Vector2(0, 7)
	
	if Input.is_action_pressed("ui_left"):
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		bullet.movement = Vector2(-7, 0)
		
	if Input.is_action_pressed("ui_right"):
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
