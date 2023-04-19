extends Control

#Thanks to CarbsCode for the snippet!


func _ready():
	get_tree().connect("files_dropped", self, "handle_dropped_file")


func handle_dropped_file(files: PoolStringArray, _screen: int):
	var dropped_image:Image = Image.new()
	dropped_image.load(files[0])
	
	var new_texture:ImageTexture = ImageTexture.new()
	new_texture.create_from_image(dropped_image, Texture.FLAG_REPEAT)
	
	apply_texture(new_texture)


func apply_texture(new_texture: ImageTexture):
	$Sprite.insert_texture(new_texture)
