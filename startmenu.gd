extends Control


func _on_Newgamebutton_pressed():
	get_tree().change_scene("res://world.tscn")


func _on_quitbutton_pressed():
	get_tree().quit()
