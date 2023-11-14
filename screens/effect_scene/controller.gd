extends Node
class_name EffectSceneController


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode in [KEY_1, KEY_2, KEY_3, KEY_4]:
			EventBus.emit_signal("speed_mode_changed", event.scancode)
