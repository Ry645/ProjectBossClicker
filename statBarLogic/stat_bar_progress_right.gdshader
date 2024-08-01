shader_type canvas_item;

uniform float valueFilled: hint_range(0.0, 1.0) = 1.0;

void fragment() {
	float clampedValue = clamp(valueFilled, 0.0, 1.0);
	if (UV.x < 0.965)
	{
		COLOR.a = 0.0;
	}
	if (clampedValue < 0.035)
	{
		if (UV.x < 1.0-clampedValue)
		{
			COLOR.a = 0.0;
		}
	}
}
