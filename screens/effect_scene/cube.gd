extends KinematicBody
class_name Cube

enum SPEED_MODE {SLOW = KEY_1, NORMAL = KEY_2, FAST = KEY_3, VERY_FAST = KEY_4}
enum POLARITY {FORWARD = 1, BACKWARD = -1}
var speed_mode_dict:Dictionary = {
	SPEED_MODE.SLOW : 100,
	SPEED_MODE.NORMAL : 500,
	SPEED_MODE.FAST: 1000,
	SPEED_MODE.VERY_FAST : 3000,
}
var speed: float
var velocity: Vector3
export(SPEED_MODE) var speed_mode = SPEED_MODE.NORMAL
export(POLARITY) var polarity = POLARITY.FORWARD
export var amplitude: int = 6


func _ready():
	speed = speed_mode_dict[speed_mode]
	EventBus.connect("speed_mode_changed", self, "_on_speed_mode_changed")


func _physics_process(delta):
	move_and_slide(Vector3(0, 0, 1 * polarity) * speed * delta)
	if abs(translation.z) >= amplitude:
		translation.z = amplitude * polarity - 0.1 * polarity
		polarity = -polarity


func _on_speed_mode_changed(mode: int):
	speed_mode = mode
	speed = speed_mode_dict[speed_mode]
