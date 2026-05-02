shader_type canvas_item;

void fragment() {
	vec2 uv = UV;
	
	float frequency = 10.0;
	float amplitude = 0.1;
	float speed = 1.0;
	
	float xwave = sin(uv.y * frequency + TIME * speed) * amplitude;
	uv.x += xwave;
	
	float ywave = sin(uv.x * frequency + TIME * speed) * amplitude;
	uv.y += ywave;
	
	COLOR = texture(TEXTURE, uv);
}
