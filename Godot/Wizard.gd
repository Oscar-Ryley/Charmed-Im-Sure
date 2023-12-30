extends CharacterBody2D

const bulletpath = preload("res://Godot/Charm.tscn")

var speed = 150
var shootable = true

func die():
	get_node("Wizard-idle").visible = false
	get_node("Spirit").visible = true

func _process(delta):
	Global.wizard_position = position - Vector2(681,362)
	
	if Global.health <= 0:
		die()
	
	if Input.is_key_pressed(KEY_D):
		position.x += delta * speed
	if Input.is_key_pressed(KEY_A):
		position.x -= delta * speed
	if Input.is_key_pressed(KEY_W):
		position.y -= delta * speed
	if Input.is_key_pressed(KEY_S):
		position.y += delta * speed
		
	if Input.is_key_pressed(KEY_E):
		Global.health = 0

	if Input.is_action_pressed("ui_up") and shootable == true:
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		bullet.movement = Vector2(0, -7)
		shootable = false
	
	if Input.is_action_pressed("ui_down") and shootable == true:
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		bullet.movement = Vector2(0, 7)
		shootable = false
	
	if Input.is_action_pressed("ui_left") and shootable == true:
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		bullet.movement = Vector2(-7, 0)
		shootable = false
		
	if Input.is_action_pressed("ui_right") and shootable == true:
		var bullet = bulletpath.instantiate()
		get_node("/root/Scene").add_child(bullet)
		bullet.position = position
		shootable = false

func _on_timer_timeout():
	shootable = true
