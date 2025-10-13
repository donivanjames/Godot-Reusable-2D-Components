extends PanelContainer

const offset: Vector2 = Vector2.ONE * 10 ## adds some space from the mouse
var opacity_tween: Tween = null ## To ensure multiple opacity tweens aren't created

func _ready() -> void: hide() ## hide tooltop on start

## Lock Tooltip position to mouse position6
func _input(event: InputEvent) -> void:
	if visible and event is InputEventMouseMotion:
		global_position = get_global_mouse_position() + offset

func toggle(on: bool):
	if on:
		show()
		modulate.a = 0.0
		tween_opacity(1.0)
	else:
		modulate.a = 1.0
		await tween_opacity(0.0).finished
		hide()


## Fade tooltip in and out
func tween_opacity(to: float):
	if opacity_tween: opacity_tween.kill()
	opacity_tween = get_tree().create_tween()
	opacity_tween.tween_property(self, 'modulate.a', to, 0.3)
	return opacity_tween
