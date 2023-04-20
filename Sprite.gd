extends Sprite

enum AxisDir { VERTICAL, HORIZONTAL, BOTH }

var start_frame = 0
var end_frame = 0
var default_anim_speed = 0.2

var window_size
var current_axis_dir = AxisDir.HORIZONTAL

var timer = Timer.new()


func _ready():
	get_tree().get_root().connect("size_changed", self, "on_window_resize")
	
	on_window_resize()
	start_anim_timer()


func start_anim_timer():
	timer = Timer.new()
	
	timer.connect("timeout", self, "on_timeout") 
	timer.set_wait_time(default_anim_speed)

	add_child(timer)
	timer.start()


func on_window_resize():
	position = OS.window_size / 2


func on_timeout():
	if (texture != null):
		if (frame < end_frame):
			frame = frame + 1
		else:
			frame = start_frame


func insert_texture(new_texture: ImageTexture):
	if current_axis_dir == AxisDir.HORIZONTAL:
		var tex_height = new_texture.get_height()
		var tex_width = new_texture.get_width()
		var h_frames = round(tex_width / tex_height)
		
		vframes = 1
		hframes = h_frames
		end_frame = h_frames - 1
		#TODO: Need to update the UI elements
		
	texture = new_texture


func on_hframes_text_changed(new_text):
	hframes = int(new_text)


func on_vframes_text_changed(new_text):
	vframes = int(new_text)


func on_preview_scale_text_changed(new_text):
	scale.x = int(new_text)
	scale.y = int(new_text)


func on_anim_speed_value_changed(value):
	timer.set_wait_time(value)


func on_start_frame_value_changed(value):
	if value >= 0 and value < hframes * vframes:
		start_frame = value
		frame = value


func on_end_frame_value_changed(value):
	if value >= 0 and value < hframes * vframes:
		end_frame = value
		frame = start_frame
