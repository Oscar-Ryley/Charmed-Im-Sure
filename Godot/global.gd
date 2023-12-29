extends Node

@export var spawn_zombie_object = preload("res://Godot/Zombie.tscn")
var spawn_pos_list = [Vector2(-675,-350), Vector2(675, 350), Vector2(-675, 350), Vector2(675, -350)]
var wizard_position = Vector2(0,0)
var zombies = 0

func spawn_zombie():
	var obj = spawn_zombie_object.instantiate()
	obj.position = spawn_pos_list[randi() % spawn_pos_list.size()]
	add_child(obj)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if zombies == 20:
		get_node("Spawn_timer").wait_time = 4
	elif zombies == 60:
		get_node("Spawn_timer").wait_time = 3
	elif zombies == 150:
		get_node("Spawn_timer").wait_time = 2

func _on_timer_timeout():
	spawn_zombie()
	zombies += 1
