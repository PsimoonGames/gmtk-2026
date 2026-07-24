extends Node2D

@export var start_pos: Vector2 = Vector2(0,0)

@onready var Truck = preload("res://Scenes/GameSubscenes/truck.tscn")

var bayTrucks = []

func _ready() -> void:
	for i in %Paths.get_children():
		bayTrucks.append("")

func createTruck(bay):
	var truck = Truck.instantiate()
	truck.position = start_pos
	truck.bayPath = %Paths.get_child(bay - 1)
	truck.bay = bay
	add_child(truck)
	bayTrucks[bay - 1] = truck

func readyToDeploy(bay):
	%TruckButtons.activateDeploy(bay)

func _on_deploy_pressed(bay: int) -> void:
	bayTrucks[bay - 1].phase = "out"
	bayTrucks[bay - 1] = ""
	%TruckButtons.get_child(1).get_child(bay - 1).visible = false
