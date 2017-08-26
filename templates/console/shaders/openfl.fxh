float4 colorTransform(float4 color, float4 tint, float4 multiplier, float4 offset) {
	float4 unmultiply = float4(color.rgb / max(color.a, 0.001), color.a);
	float4 result = unmultiply * tint * multiplier + offset;
	result = clamp(result, 0.0, 1.0);
	return float4(result.rgb * result.a, result.a);
}
