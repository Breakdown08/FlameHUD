extends BaseDialogButton

var fade_effect: FadeEffect


func _ready():
	EventBus.connect("fade_effect_performed", self, "_on_fade_effect_performed")


func _on_Button2_pressed():
	fade_effect = ScreenManager.fade_effect_scene.instance()
	get_tree().root.add_child(fade_effect)


func _on_fade_effect_performed():
	ScreenManager.change_scene(ScreenManager.effect_scene)
