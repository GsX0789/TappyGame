extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GoToMainMenu()


func GoToMainMenu():
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_packed(GameManager.mainScene)
