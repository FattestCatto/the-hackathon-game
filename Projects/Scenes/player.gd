extends CharacterBody2D
class speed_class:
	var x = 0
	var y = 0
	@export var loss = 2
	@export var gain = 5
	@export var maximum = 400

var speed = speed_class.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var resolution = get_viewport().get_visible_rect()
	position = Vector2(resolution.size[0]/2, resolution.size[1]/2)	# Place the player in the middle of the screen.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity_calc(direction)
	velocity = Vector2(speed.x,speed.y)
	move_and_slide()

func velocity_calc(direction_var):
											## X axis speed and velocity management
	if direction_var.x != 0: #If moving
		speed.x += direction_var.x * speed.gain #Gain speed on the respective X axis direction_var (if negative direction_var = left)
		speed.x = max(min(speed.x,speed.maximum), -speed.maximum) #inner min clamps the upper limit of speed.x/y, outer max clamps the lower limit
		speed.y = max(min(speed.y,speed.maximum), -speed.maximum)
	else: #if left or right are not pressed
		if speed.x < 0: #if the speed is going to the left
			if is_on_wall():
				speed.x = 1
			speed.x = min(speed.x + speed.loss, 0) #Clamp the negative speed to the minimum of the 2 results
		elif speed.x > 0:#if the speed is going to the right
			if is_on_wall():
				speed.x = -1
			speed.x = max(speed.x - speed.loss, 0) #Clamp the positive speed to the maximum of the 2 results
			## End of X axis management

#Similar or same actions on y axis

	if direction_var.y != 0: #If moving
		speed.y += direction_var.y * speed.gain #Gain speed on the respective y axis direction_var (if negative direction_var = left)
		speed.y = max(min(speed.y,speed.maximum), -speed.maximum) #inner min clamps the upper limit of speed.x/y, outer max clamps the lower limit
		speed.y = max(min(speed.y,speed.maximum), -speed.maximum)
	else: #if left or right are not pressed
		if speed.y < 0: #if the speed is going up
			if is_on_ceiling():
				speed.y = 1
			speed.y = min(speed.y + speed.loss, 0) #Clamp the negative speed to the minimum of the 2 results
		elif speed.y > 0:#if the speed is going down
			if is_on_floor():
				speed.y = -1
			speed.y = max(speed.y - speed.loss, 0) #Clamp the positive speed to the maximum of the 2 results
			## End of y axis management
