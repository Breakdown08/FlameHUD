extends BaseDialogButton

var grid_item: Node


func _on_Button3_pressed():
	grid_item = get_parent().get_children()[0]
	get_parent().move_child(grid_item, get_parent().get_child_count() - 1)
