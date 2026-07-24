extends Node2D

func activateDeploy(bay):
	$Deploy.get_child(bay - 1).visible = true
