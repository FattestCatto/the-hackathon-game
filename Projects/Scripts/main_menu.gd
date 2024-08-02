extends Control

@onready var res_options = $Buttons/Options/OptionsMenu/ResolutionOptions
@onready var window_options = $Buttons/Options/OptionsMenu/WindowOptions

func _ready():
	###AudioPlayer._play_menu_music()
	pass

func _input(_event):
	if Input.is_action_just_pressed("F11") or (Input.is_action_pressed("Alt") and Input.is_action_pressed("Enter")):
		get_window().content_scale_size = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen())
		Resources.window_mode = 3
		Resources.resolution = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen())
		var index = 0
		for i in Resources.resolutions:
			if i == res_options.get_item_text(index):
				res_options.select(index)
				break
			index += 1
		window_options.select(1)
		get_window().set_mode(Window.MODE_FULLSCREEN)
		var config = ConfigFile.new()
		config.load("res://Config/config.ini")
		config.set_value("Settings","screen_width",Resources.resolution.x)
		config.set_value("Settings","screen_height",Resources.resolution.y)
		config.set_value("Settings","window_mode", 3)
		config.save("res://Config/config.ini")
# Called when the node enters the scene tree for the first time.
