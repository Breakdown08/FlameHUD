extends ColorRect
class_name FadeEffect

enum FADE_MODE {FADE_IN, FADE_OUT}
export(FADE_MODE) var fade_mode = FADE_MODE.FADE_OUT


func _ready():
	var tween = get_tree().create_tween()
	if fade_mode == FADE_MODE.FADE_OUT:
		tween.tween_property(self, "color:a", 1, 1)
	else:
		tween.tween_property(self, "color:a", 0, 1)
	tween.tween_callback(self, "_performed")	


func _performed():
	EventBus.emit_signal("fade_effect_performed")
	self.queue_free()
