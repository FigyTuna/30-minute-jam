extends Node2D

var speed = 10

func _ready():
	$Player.y_speed = speed
	$Road.speed = speed

func _physics_process(delta):
	speed += 0.2
	$Player.y_speed = speed
	$Road.speed = speed