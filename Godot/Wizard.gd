extends CharacterBody2D

const bulletpath = preload("res://Godot/Charm.tscn")

var speed = 150
var shootable = true
var deal_damage = false

func die():
	get_node("Wizard-idle").visible = false
	get_node("Charmed-Zombie").visible = false
	get_node("Spirit").visible = true
	get_node("Wizard-Area").set_monitoring(false)
	get_node("Spirit-Area").set_monitoring(true)
	Global.dead = true

func revive():
	Global.health = 6
	get_node("Spirit").visible = false
	get_node("Charmed-Zombie").visible = true
	get_node("Wizard-Area").set_monitoring(true)
	get_node("Spirit-Area").set_monitoring(false)

func ready():
	get_node("Spirit-Area").set_monitoring(false)

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

func _on_spirit_area_area_entered(area):
	if area.get_name() == "Charmable2" and Global.dead == true:
		revive()

func _on_wizard_area_area_entered(area):
	print(area.get_name())
	if area.get_name() == "Charmable2" or area.get_name() == "Zombie-Area2D":
		deal_damage = true

func _on_attack_timer_timeout():
	if deal_damage == true:
		Global.health -= 1

func _on_wizard_area_area_exited(area):
	print(area.get_name())
	if area.get_name() == "Charmable2" or area.get_name() == "Zombie-Area2D":
		deal_damage = false
