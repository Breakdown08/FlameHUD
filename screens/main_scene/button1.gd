extends BaseDialogButton


func _on_Button1_pressed():
	self.dialog.title.text = "ПОДТВЕРЖДЕНИЕ ПЕРЕХОДА НА ДРУГУЮ СЦЕНУ"
	self.dialog.confirm_button.text = "ПЕРЕХОД"
	self.dialog.caller = self
	self.dialog.show()


func _on_dialog_confirmed():
	ScreenManager.change_scene(ScreenManager.sphere_scene)
