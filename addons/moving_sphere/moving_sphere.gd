extends Spatial
class_name CircleFlame

onready var sphere = $CSGSphere
var dt: float = 0.0
export var movement_radius: float = 10.0
export var speed: float = 6.0
var delimiter: int = 10


func _process(delta):
	dt += delta
	sphere.translation = Vector3(
		sin(dt * speed / delimiter) * movement_radius,
		0,
		cos(dt * speed / delimiter) * movement_radius
	) + Vector3.ZERO
