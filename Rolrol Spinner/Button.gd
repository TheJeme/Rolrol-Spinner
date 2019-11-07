extends Button

onready var _bar = get_node("/root/Node/Interface/ExperienceBar")
onready var Spinners1 = get_node("/root/Node/Interface/BottomUI/Spinners")
onready var Spinners2 = get_node("/root/Node/Interface/BottomUI/Spinners2")
onready var SpinnerSprite = get_node("/root/Node/Spinner/Sprite")
onready var ParticleSystem = get_node("/root/Node/Particles2D")

onready var _character = get_node("/root/Node/Spinner")

var spinnerSprites = [preload("res://Sprites/spinner1.png"), 
			preload("res://Sprites/spinner2.png"),
			preload("res://Sprites/spinner3.png"),
			preload("res://Sprites/spinner4.png"),
			preload("res://Sprites/spinner5.png"),
			preload("res://Sprites/spinner6.png"),
			preload("res://Sprites/spinner7.jpg"),
			preload("res://Sprites/spinner8.png")]

onready var Spins = [get_node("/root/Node/Interface/BottomUI/Spinners/ColorRect/Button1/Spinner1"),
					get_node("/root/Node/Interface/BottomUI/Spinners/ColorRect2/Button2/Spinner2"),
					get_node("/root/Node/Interface/BottomUI/Spinners/ColorRect3/Button3/Spinner3"),
					get_node("/root/Node/Interface/BottomUI/Spinners/ColorRect4/Button4/Spinner4"),
					get_node("/root/Node/Interface/BottomUI/Spinners2/ColorRect1/Button1/Spinner1"),
					get_node("/root/Node/Interface/BottomUI/Spinners2/ColorRect2/Button2/Spinner2"),
					get_node("/root/Node/Interface/BottomUI/Spinners2/ColorRect3/Button3/Spinner3"),
					get_node("/root/Node/Interface/BottomUI/Spinners2/ColorRect4/Button4/Spinner4")]

var isUnlocked2
var isUnlocked3
var isUnlocked4
var isUnlocked5
var isUnlocked6
var isUnlocked7
var isUnlocked8


var isSelection

var secretTap

func _ready():
	_bar.show()
	Spinners1.hide()
	Spinners2.hide()
	secretTap = 0
	
func _process(delta):
	if _character.level == 5:
		Spins[1].set_texture(spinnerSprites[1])
		isUnlocked2 = true
	if _character.level == 10:
		Spins[2].set_texture(spinnerSprites[2])
		isUnlocked3 = true
	if _character.level == 15:
		Spins[3].set_texture(spinnerSprites[3])
		isUnlocked4 = true
	if _character.level == 20:
		Spins[4].set_texture(spinnerSprites[4])
		isUnlocked5 = true
	if _character.level == 25:
		Spins[5].set_texture(spinnerSprites[5])
		isUnlocked6 = true
	if _character.level == 30:
		Spins[6].set_texture(spinnerSprites[6])
		isUnlocked7 = true
	if _character.level == 35:
		Spins[7].set_texture(spinnerSprites[7])
		isUnlocked8 = true


func _on_Button_pressed():
	if !isSelection:
		_bar.hide()
		Spinners1.show()
		isSelection = true
	else:
		_bar.show()
		Spinners1.hide()
		Spinners2.hide()
		isSelection = false


func _on_Button1_pressed():
	if isSelection:
		SpinnerSprite.set_texture(spinnerSprites[0])


func _on_Button2_pressed():
	if isSelection and isUnlocked2:
		SpinnerSprite.set_texture(spinnerSprites[1])


func _on_Button3_pressed():
	if isSelection and isUnlocked3:
		SpinnerSprite.set_texture(spinnerSprites[2])


func _on_Button4_pressed():
	if isSelection and isUnlocked4:
		SpinnerSprite.set_texture(spinnerSprites[3])
		
func _on_Button5_pressed():
	if isSelection and isUnlocked5:
		SpinnerSprite.set_texture(spinnerSprites[4])


func _on_Button6_pressed():
	if isSelection and isUnlocked6:
		SpinnerSprite.set_texture(spinnerSprites[5])


func _on_Button7_pressed():
	if isSelection and isUnlocked7:
		SpinnerSprite.set_texture(spinnerSprites[6])


func _on_Button8_pressed():
	if isSelection and isUnlocked8:
		SpinnerSprite.set_texture(spinnerSprites[7])


func _on_ButtonUI_pressed():
	secretTap += 1
	if secretTap >= 10:
		ParticleSystem.set_emitting(true)


func _on_ButtonSpinner_pressed():
	if isSelection and Spinners1.is_visible():
		Spinners1.hide()
		Spinners2.show()
	elif isSelection and Spinners2.is_visible():
		Spinners1.show()
		Spinners2.hide()

