extends Node2D

@onready var pause_menu =  $PauseMenu
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
		


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



