extends Node2D

var move_left = false
var move_right = false

var speed = 500

var y_speed = 0

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("left"):
		move_left = true
	if event.is_action_released("left"):
		move_left = false
	if event.is_action_pressed("right"):
		move_right = true
	if event.is_action_released("right"):
		move_right = false

func _physics_process(delta):
	var go = 0
	if move_left:
		go -= speed
	if move_right:
		go += speed
	position.x += delta * go
	
	position.y = 550 - (y_speed / 6)
	
	if position.x < 50:
		position.x = 50
	if position.x > 970:
		position.x = 970

func _on_Area2D_area_entered(area):
	get_tree().reload_current_scene()
