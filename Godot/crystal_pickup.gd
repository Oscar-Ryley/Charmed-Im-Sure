extends Node2D

func _on_crystal_area_area_entered(area):
	if area.get_name() == "Wizard-Area":
		queue_free()
		Global.kills += 1
