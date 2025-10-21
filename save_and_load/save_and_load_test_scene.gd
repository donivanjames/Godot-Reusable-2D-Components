extends Node

var data: SaveDataResource = SaveAndLoad.save_file_data


func _on_increment_button_pressed() -> void:
	data.stage_level += 1
	data.player.player_level += 1
	print("player level: %s, stage level: %s" % [data.player.player_level, data.stage_level])


func _on_save_button_pressed() -> void:
	SaveAndLoad._save()


func _on_load_button_pressed() -> void:
	SaveAndLoad._load()
	data = SaveAndLoad.save_file_data # need to reassign the data
	print("player level: %s, stage level: %s" % [data.player.player_level, data.stage_level])
