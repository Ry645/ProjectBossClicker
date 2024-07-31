shader_type canvas_item;

uniform float valueFilled: hint_range(0.0, 1.0) = 1.0;

void fragment() {
	float clampedValue = clamp(valueFilled, 0.0, 1.0);
	if (UV.x > clampedValue-0.025)
	{
		COLOR.a = 0.0;
	}
}

