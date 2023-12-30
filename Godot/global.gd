extends Node

@export var spawn_zombie_object = preload("res://Godot/Zombie.tscn")
var spawn_pos_list = [Vector2(-675,-350), Vector2(675, 350), Vector2(-675, 350), Vector2(675, -350)]
var wizard_position = Vector2(0,0)
var zombies = 0
var kills = 0
var health = 6

func spawn_zombie(charmable):
	var obj = spawn_zombie_object.instantiate()
	obj.position = spawn_pos_list[randi() % spawn_pos_list.size()]
	if charmable:
		obj.charmable = true
	add_child(obj)

func _ready():
	pass

func _process(delta):
	if zombies == 10:
		get_node("Spawn_timer").wait_time = 4
	elif zombies == 20:
		get_node("Spawn_timer").wait_time = 3
	elif zombies == 30:
		get_node("Spawn_timer").wait_time = 2
	elif zombies == 60:
		get_node("Spawn_timer").wait_time = 1.5
	elif zombies == 100:
		get_node("Spawn_timer").wait_time = 1

func _on_timer_timeout():
	if randi_range(0, 4) == 4:
		spawn_zombie(true)
	else:
		spawn_zombie(false)
	zombies += 1
