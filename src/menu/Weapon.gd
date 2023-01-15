extends TextureRect

const FOCUS_COLOR = Color.white
const UNFOCUS_COLOR = Color(0.5, 0.5, 0.5, 0.9)

func focus():
	var shader = material as ShaderMaterial
	shader.set_shader_param("modulate", FOCUS_COLOR)
	
func unfocus():
	var shader = material as ShaderMaterial
	shader.set_shader_param("modulate", UNFOCUS_COLOR)
