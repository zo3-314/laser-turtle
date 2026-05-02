shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;

void fragment() {
	vec2 uv = UV;
	
	float frequency = 1.0;
	float amplitude = 0.01;
	float speed = 1.0;
	
	float xwave = sin(uv.y * frequency + TIME * speed) * amplitude;
	uv.x += xwave;
	
	float ywave = sin(uv.x * frequency + TIME * speed) * amplitude;
	uv.y += ywave;
	
	COLOR = texture(screen_texture, uv);
}
