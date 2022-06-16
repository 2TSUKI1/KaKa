extends Node2D



var rng = RandomNumberGenerator.new()
var rn1 = 0
var xn=0


var img = ["res://donut/d1.png","res://donut/d2.png","res://donut/d3.png","res://donut/d4.png"]
var shi_img=["/root/Node2D/ColorRect/imgs/0563","/root/Node2D/ColorRect/imgs/1500","/root/Node2D/ColorRect/imgs/2500","/root/Node2D/ColorRect/imgs/3563"]

var counter = 0


# Called when the node enters the scene tree for the first time.

func _ready():
	if(str(counter)!= load1() && load1()!=null ):
		counter = int(load1())
	get_node("AudioStreamPlayer").playing=false
	get_node("AudioStreamPlayer2").playing=false
	get_node("AudioStreamPlayer3").playing=false





func _on_TouchScreenButton_pressed():
	
	counter = counter+1
	save(counter)
	get_node("/root/Node2D/ColorRect/count").set_text(str(counter))
	invi_imgs()
	special()
	rng.randomize()
	var rn = rng.randi_range(0, 3)
	#print(rn)
	var mgs = str(img[rn])+""
	#print(str(mgs))
	var icon = load(mgs)
	
	$TouchScreenButton.set_texture(icon)



func _on_TouchScreenButton_released():
	#print("No")
	#invi_imgs()
	
	print(get_node("AudioStreamPlayer").playing)




func invi_imgs():
	get_node("AudioStreamPlayer2").playing=false
	get_node("AudioStreamPlayer3").playing=false
	#print(int(load1()))
	for item in shi_img:
		get_node(item).visible=false

func special():
	rng.randomize()
	var nn=rng.randi_range(0, 9)
	if(counter%10==nn):
		xn=rng.randi_range(0, 1)
		rng.randomize()
		rn1 = rng.randi_range(0, 3)
		#print(get_node(shi_img[rn1]).visible)
		get_node(shi_img[rn1]).visible=true
		if(xn==0):
			get_node("AudioStreamPlayer2").play()
			get_node("/root/Node2D/ColorRect/count2").set_text("kakaka kakaka")
		if(xn==1):
			get_node("AudioStreamPlayer3").play()
			get_node("/root/Node2D/ColorRect/count2").set_text("kaka kakaka kakakakaka")
	else:
		get_node("AudioStreamPlayer").play()
		get_node("/root/Node2D/ColorRect/count2").set_text("kaka")
		

func save(content):
	var file = File.new()
	file.open("user://save_game.json", File.WRITE)
	file.store_string(str(content))
	file.close()

func load1():
	var file = File.new()
	file.open("user://save_game.json", File.READ)
	var content = file.get_as_text()
	file.close()
	return content
