extends Node

@export var spawn_zombie = preload("res://Godot/Zombie.tscn")
var spawn_pos_list = [Vector2(-675,-350), Vector2(675, 350), Vector2(-675, 350), Vector2(675, -350)]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while true:
		await get_tree().create_timer(5).timeout
		var obj = spawn_zombie.instantiate()
		obj.position = spawn_pos_list[randi() % spawn_pos_list.size()]
		add_child(obj)
