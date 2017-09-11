float4 colorTransform(float4 color, float4 multiplier, float4 offset) {
	float a = color.a*multiplier.a + offset.a;
	return float4(color.rgb*multiplier.rgb + offset.rgb*a, a);
}
