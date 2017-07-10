
float4 colorTransform(float4 color, float4 tint, float4 multiplier, float4 offset) {
	float4 unmultiply;
	if (color.a <= 0.001) {
		unmultiply = float4(0.0, 0.0, 0.0, 0.0);
	} else {
		unmultiply = float4(color.rgb / color.a, color.a);
	}
	float4 result = unmultiply * tint * multiplier;
	result = result + offset;
	result = clamp(result, 0.0, 1.0);
	return float4(result.rgb * result.a, result.a);
}

