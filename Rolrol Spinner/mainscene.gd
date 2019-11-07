extends Node

onready var _character = $Spinner
onready var _label = $Interface/BottomUI/Button/Label
onready var _bar = $Interface/ExperienceBar

func _ready():
	_label.update_text(_character.level)
	_bar.initialize(_character.experience, _character.experience_required)


#func _input(event):
#	if event.is_pressed():
#		_character.gain_experience(34)
#		_label.update_text(_character.level)
