extends Control

onready var le_hframes = $VB/HB/HFrames/HFrames
onready var le_vframes = $VB/HB/VFrames/VFrames
onready var sb_start_frame = $VB/HB/FrameRange/StartFrame
onready var sb_end_frame = $VB/HB/FrameRange/EndFrame
onready var le_preview_scale = $VB/HB2/PreviewScale/PreviewScale
onready var cpb_bg_color = $VB/HB2/BGColor/ColorPickerButton
onready var le_anim_speed = $VB/HB2/AnimSpeed/AnimSpeed

var bg_color = Color("4b738b")


func _ready():
	get_tree().connect("files_dropped", self, "handle_dropped_file")
	
	#Set defaults
	le_hframes.value = 1
	le_vframes.value = 1
	sb_start_frame.value = 0
	sb_end_frame.value = 0
	le_preview_scale.value = 5
	cpb_bg_color.color = bg_color
	le_anim_speed.value = 0.2

	$ColorRect.color = bg_color


#Thanks to CarbsCode for this functions snippet!
func handle_dropped_file(files: PoolStringArray, _screen: int):
	var dropped_image:Image = Image.new()
	dropped_image.load(files[0])
	
	var new_texture:ImageTexture = ImageTexture.new()
	new_texture.create_from_image(dropped_image, Texture.FLAG_REPEAT)
	
	$Sprite.insert_texture(new_texture)


func on_color_picker_color_changed(color):
	$ColorRect.color = color
