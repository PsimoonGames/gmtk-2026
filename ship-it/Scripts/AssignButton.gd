extends TextureButton

@export var bay: int = 0

func _on_pressed() -> void:
	visible = false
	%Trucks.createTruck(bay)
