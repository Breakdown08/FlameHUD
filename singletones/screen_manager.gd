extends Node

var main_scene = preload("res://screens/main_scene/main_scene.tscn")
var sphere_scene = preload("res://screens/sphere_scene/sphere_scene.tscn")
var effect_scene = preload("res://screens/effect_scene/effect_scene.tscn")

var _params = null


func change_scene(next_scene, params=null):
	_params = params
	get_tree().change_scene_to(next_scene)


func get_param(key):
	if _params != null and _params.has(key):
		return _params[key]
	return null
