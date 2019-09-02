extends Node2D

var RoadThing = preload("RoadThing.tscn")
var Bomb = preload("Obstacle.tscn")

var timer = 2

var speed = 100.0

var rate = 2

func _ready():
	for i in range(0, 200):
		var thing = RoadThing.instance()
		thing.position.x = 512
		thing.position.y = -i * 270
		add_child(thing)

func _physics_process(delta):
	position.y += speed * delta
	timer -= delta
	if timer < 0:
		var bomb = Bomb.instance()
		bomb.position.y = -100 - position.y
		bomb.position.x = rand_range(50, 970)
		add_child(bomb)
		rate -= 0.05
		timer = rate
		if rate < 0.1:
			rate = 0.2