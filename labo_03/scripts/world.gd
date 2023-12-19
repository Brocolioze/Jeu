extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()
	
func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false
		


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
			Global.finish_changescenes()



