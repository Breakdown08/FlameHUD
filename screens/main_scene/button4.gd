extends BaseDialogButton


func _on_Button4_pressed():
	self.dialog.title.text = "ПОДТВЕРЖДЕНИЕ ВЫХОДА ИЗ ПРИЛОЖЕНИЯ"
	self.dialog.confirm_button.text = "ВЫЙТИ"
	self.dialog.caller = self
	self.dialog.show()
	
	
func _on_dialog_confirmed():
	get_tree().quit()
