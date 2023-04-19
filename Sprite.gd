extends Sprite

enum AxisDir { VERTICAL, HORIZONTAL, BOTH }

var min_h_frames = 0
var max_h_frames = 0
var wait_time = 0.2

var window_size
var current_axis_dir = AxisDir.HORIZONTAL


func _ready():
	get_tree().get_root().connect("size_changed", self, "on_window_resize")
	
	on_window_resize()
	start_anim_timer()


func start_anim_timer():
	var timer = Timer.new()
	
	timer.connect("timeout", self, "on_timeout") 
	timer.set_wait_time(wait_time)

	add_child(timer)
	timer.start()


func on_window_resize():
	position = OS.window_size / 2


func on_timeout():
	if (texture != null):
		if (frame < max_h_frames - 1):
			frame = frame + 1
		else:
			frame = 0


func insert_texture(new_texture: ImageTexture):
	if current_axis_dir == AxisDir.HORIZONTAL:
		var tex_height = new_texture.get_height()
		var tex_width = new_texture.get_width()
		var h_frames = round(tex_width / tex_height)
		
		hframes = h_frames
		max_h_frames = h_frames
		
	texture = new_texture
