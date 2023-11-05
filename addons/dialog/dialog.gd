extends Control
class_name MainSceneDialog

onready var title = $PanelContainer/MarginContainer/GridContainer/Label
onready var confirm_button = $PanelContainer/MarginContainer/GridContainer/MarginContainer/HBoxContainer/ConfirmButton
onready var cancel_button = $PanelContainer/MarginContainer/GridContainer/MarginContainer/HBoxContainer/CancelButton
var caller: Button


func _ready():
	EventBus.connect("get_dialog_path", self, "_on_get_dialog_path")


func _on_get_dialog_path() -> void:
	EventBus.emit_signal("send_dialog_path", get_path())


func show():
	self.visible = true


func _on_ConfirmButton_pressed():
	self.visible = false
	caller.call("_on_dialog_confirmed")
	caller = null


func _on_CancelButton_pressed():
	self.visible = false
	caller = null
