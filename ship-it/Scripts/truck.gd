extends CharacterBody2D

@export var speed : int = 100
@export var cargo : int = 0
var bay
var bayPath
var inLength
var outLength
var phase = "in"

func _ready() -> void:
	inLength = bayPath.get_child(0).curve.get_baked_length()
	outLength = bayPath.get_child(1).curve.get_baked_length()


func _process(delta: float) -> void:
	if phase == "in":
		bayPath.get_child(0).get_child(0).progress += speed * delta
		transform = bayPath.get_child(0).get_child(0).transform
		if inLength - bayPath.get_child(0).get_child(0).progress < 50:
			bayPath.get_child(1).get_child(0).progress = 60
			transform = bayPath.get_child(1).get_child(0).transform
			phase = "load"
			cargo = 12
	
	if phase == "load" and cargo >= 12:
		get_parent().readyToDeploy(bay)
	
	if phase == "out":
		bayPath.get_child(1).get_child(0).progress += speed * delta
		transform = bayPath.get_child(1).get_child(0).transform
		if outLength - bayPath.get_child(1).get_child(0).progress < 10:
			queue_free()
