shader_type canvas_item;

uniform float proportionFilled = 0.75;

void fragment() {
	float clampedProportion = clamp(proportionFilled, 0.0, 1.0);
	if (UV.x > clampedProportion-0.025)
	{
		COLOR.a = 0.0;
	}
}

