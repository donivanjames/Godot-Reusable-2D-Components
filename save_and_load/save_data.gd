class_name SaveDataResource extends Resource

# saved data must be an @export, can be any Godot variable or resource
@export var player: CharacterResource = CharacterResource.new()
@export var stage_level: int = 1
