extends CanvasLayer
class_name FadeEffect

enum FADE_MODE {FADE_IN, FADE_OUT} #OUT - затухание
export(FADE_MODE) var fade_mode = FADE_MODE.FADE_OUT
onready var timer: Timer = $Timer
onready var effect = $Control/ColorRect
var effect_value: float


func _ready():
	timer.start()


func _process(delta):
	if !timer.is_stopped():
		if fade_mode == FADE_MODE.FADE_OUT:
			var time_left = reverse_time_left(timer.time_left, timer.wait_time)
			if time_left > 0.1:
				effect_value = time_left
		else:
			effect_value = timer.time_left
		effect.color.a = effect_value


func _on_Timer_timeout():
	EventBus.emit_signal("fade_effect_performed")
	self.queue_free()


func reverse_time_left(time_left: float, wait_time: float):
	return wait_time - time_left
