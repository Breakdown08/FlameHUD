extends Button
class_name BaseDialogButton

var dialog: MainSceneDialog setget _set_dialog,_get_dialog


func _set_dialog(new_value: MainSceneDialog) -> void:
		pass
	
	
func _get_dialog() -> MainSceneDialog:
	EventBus.emit_signal("get_dialog_path")
	return dialog
	
	
func _on_send_dialog_path(path): 
	dialog = get_node(path)


func _ready():
	EventBus.connect("send_dialog_path", self, "_on_send_dialog_path")
	
	
func _on_dialog_confirmed():
	pass
