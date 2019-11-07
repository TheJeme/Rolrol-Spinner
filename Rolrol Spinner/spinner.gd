extends KinematicBody2D

var elapsed_time = 0    
var start
var speed = 0
var start_time
var direction

var level = 1

onready var _label = get_node("/root/Node/Interface/BottomUI/Button/Label")


signal experience_gained(growth_data)

var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)

func get_required_experience(level):
	return round(pow(level, 3.2) + level * 25)

func _input(event):
    if event is InputEventMouseButton:
        if event.is_pressed():
            start = event.position
            start_time = elapsed_time
        else:
            direction = event.position - start

            if event.position.y < 960 and event.position.x < 540:
                 if abs(direction.x) < abs(direction.y):
                     if direction.y < 0:
                         addSpeed(false)
                     elif direction.y > 0:
                         addSpeed(true)
                 elif abs(direction.x) > abs(direction.y):
                     if direction.x < 0:
                         addSpeed(true)
                     elif direction.x > 0:
                         addSpeed(false)
            elif event.position.y < 960 and event.position.x > 540:
                 if abs(direction.x) < abs(direction.y):
                     if direction.y < 0:
                         addSpeed(true)
                     elif direction.y > 0:
                         addSpeed(false)
                 elif abs(direction.x) > abs(direction.y):
                     if direction.x < 0:
                         addSpeed(true)
                     elif direction.x > 0:
                         addSpeed(false)
            elif event.position.y > 960 and event.position.x < 540:
                 if abs(direction.x) < abs(direction.y):
                     if direction.y < 0:
                         addSpeed(false)
                     elif direction.y > 0:
                         addSpeed(true)
                 elif abs(direction.x) > abs(direction.y):
                     if direction.x < 0:
                         addSpeed(false)
                     elif direction.x > 0:
                         addSpeed(true)
            elif event.position.y > 960 and event.position.x > 540:
                 if abs(direction.x) < abs(direction.y):
                     if direction.y < 0:
                         addSpeed(true)
                     elif direction.y > 0:
                         addSpeed(false)
                 elif abs(direction.x) > abs(direction.y):
                     if direction.x < 0:
                         addSpeed(false)
                     elif direction.x > 0:
                         addSpeed(true)
            direction = direction.normalized()
			
#            if event.position.x < 540:
#                 pass
#            elif event.position.x > 540:
#                 pass
#            if event.position.y < 960:
#                 if direction.x < 0:
#                     addSpeed(true)
#                 elif direction.x > 0:
#                     addSpeed(false)
#            elif event.position.y > 960:
#                 if direction.x < 0:
#                     addSpeed(false)
#                 elif direction.x > 0:
#                     addSpeed(true)
#            direction = direction.normalized()
            print(direction)

func _ready():
	pass
	
func addSpeed(reverse):
	if reverse and speed > -22000:
		speed -= (direction.length()) / (elapsed_time - start_time)
	elif !reverse and speed < 22000:
		speed += (direction.length()) / (elapsed_time - start_time)
		

func _process(delta):
	rotation += speed * 0.001 * delta
	if speed > -50 and speed < 50:
		speed = 0
	elif speed < -5:
		speed *= 0.995
		gain_experience(abs(speed * 0.001))
	elif speed > 5:
		speed *= 0.995
		gain_experience(abs(speed * 0.001))

	elapsed_time += delta
	
func gain_experience(amount):
	experience_total += amount
	experience += amount
	var growth_data = []
	while experience >= experience_required:
		experience -= experience_required
		growth_data.append([experience_required, experience_required])
		level_up()
	growth_data.append([experience, get_required_experience(level + 1)])
	emit_signal("experience_gained", growth_data)


func level_up():
	level += 1
	experience_required = get_required_experience(level + 1)
	_label.update_text(level)
	
		

	
	