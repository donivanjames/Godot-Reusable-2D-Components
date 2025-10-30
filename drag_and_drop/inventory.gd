extends Panel
# https://youtu.be/JUR1qQ79eJY?si=W4vkm-bfInIOrBh5

# custom cursors let us bypass the weird cursor problems in godot
const CURSOR_NONE = preload("uid://cfqc8r1dc88lt")
const CURSOR_COPY = preload("uid://b1k2h0tabi72v")
const CURSOR_DISABLED = preload("uid://bbka81g3oi2q3")

var data_back ## the last slot before the drag


func _ready() -> void:
	Input.set_custom_mouse_cursor(CURSOR_NONE, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(CURSOR_DISABLED, Input.CURSOR_FORBIDDEN)
	Input.set_custom_mouse_cursor(CURSOR_COPY, Input.CURSOR_CAN_DROP)
	Input.set_custom_mouse_cursor(CURSOR_NONE, Input.CURSOR_DRAG)


## Ensure the drag leads somewhere
func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_back = get_viewport().gui_get_drag_data() # gets the initial drag slot (maybe?)

	if what == Node.NOTIFICATION_DRAG_END:
		# if drag leads to an invalide position: return to last spot
		if not is_drag_successful():
			if data_back:
				data_back.icon.show()
				data_back = get_theme_default_base_scale()
