extends Panel
# https://youtu.be/JUR1qQ79eJY?si=Nb1VnbMYSviqPUAg

@onready var icon: TextureRect = $Icon
@export var item: DragItemData: ## the item the slot holds
	# setter function that updates the slot any time item changes - could be very useful
	set(value):
		item = value

		if is_node_ready() and item:
			update_ui()


func _ready() -> void:
	update_ui()


func update_ui():
	if not item: 
		icon.texture = null
		return

	icon.texture = item.icon
	tooltip_text = item.item_name


## Drag a preview of the item with the mouse
func _get_drag_data(_at_position: Vector2) -> Variant:
	if not item: return

	var preview = duplicate() # duplicate this object as a preview

	# center on mouse
	var c = Control.new()
	c.add_child(preview)
	preview.position -= Vector2(25,25) # I believe the preview icon is 50x50px
	preview.self_modulate = Color.TRANSPARENT # hide background
	c.modulate = Color(c.modulate, 0.5) # make semi-transparent

	set_drag_preview(c) # puts the node under the mouse while we drag

	return self


## The reciever slot for the item
func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var tmp = item # item to swap
	item = data.item
	data.item = tmp
	icon.show()
	data.icon.show()
	update_ui()
	data.update_ui()
