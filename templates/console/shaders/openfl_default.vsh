#include "common.fxh"


MATRIX_ORDER float4x4 g_transform : register (c0);
float4 g_colorMultiplier : register (c4);
float4 g_colorOffset     : register (c5);


struct VS_IN {

	float3 Pos : POSITION;
	float2 Texcoord : TEXCOORD;
	float4 ColorMul : COLOR;
	float4 ColorAdd : COLOR1;

};


struct VS_OUT {

	float4 ProjPos : VS_OUT_POSITION;
	float4 ColorMul : COLOR;
	float4 ColorAdd : COLOR1;
	float2 Texcoord : TEXCOORD;

};


VS_OUT main (VS_IN In) {

	VS_OUT Out;
	Out.ProjPos = mul( g_transform, float4( In.Pos, 1 ) );
	Out.ColorMul = In.ColorMul * g_colorMultiplier;
	Out.ColorAdd = In.ColorAdd + g_colorOffset;
	//Out.color.rgb = gammaToLinear(Out.Color.rgb);
	Out.Texcoord = In.Texcoord;
	return Out;

}
