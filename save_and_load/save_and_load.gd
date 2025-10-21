extends Node
# Add this to Globals

# https://youtu.be/xG2GGniUa5o?si=bLuAMTqBfVh1LM8g
const save_location = "user://save_file.tres"
const user_settings_save_location = "user://user_settings_save_file.tres" # can have multiple save file types

var save_file_data: SaveDataResource = SaveDataResource.new() # will auto create a new file if nothing is loaded


func _ready() -> void:
	_load() # optional based on your game needs


func _save():
	ResourceSaver.save(save_file_data, save_location)
	print("Saved Game")


func _load():
	# See if save file exists and load it
	if FileAccess.file_exists(save_location):
		save_file_data = ResourceLoader.load(save_location).duplicate(true) # duplicate creates a copy instead of a pointer
		print("Save data found")
