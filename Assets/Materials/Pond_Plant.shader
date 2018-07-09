// Upgrade NOTE: upgraded instancing buffer 'BoomerangPond_Plant' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Boomerang/Pond_Plant"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Pond_Plant_A("Pond_Plant_A", 2D) = "white" {}
		_D("D", Color) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Pond_Plant_A;
		uniform float4 _Pond_Plant_A_ST;
		uniform float _Cutoff = 0.5;

		UNITY_INSTANCING_BUFFER_START(BoomerangPond_Plant)
			UNITY_DEFINE_INSTANCED_PROP(float4, _D)
#define _D_arr BoomerangPond_Plant
		UNITY_INSTANCING_BUFFER_END(BoomerangPond_Plant)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _D_Instance = UNITY_ACCESS_INSTANCED_PROP(_D_arr, _D);
			float2 uv_Pond_Plant_A = i.uv_texcoord * _Pond_Plant_A_ST.xy + _Pond_Plant_A_ST.zw;
			float4 tex2DNode1 = tex2D( _Pond_Plant_A, uv_Pond_Plant_A );
			o.Albedo = ( _D_Instance * tex2DNode1.r ).rgb;
			o.Alpha = 1;
			clip( tex2DNode1.g - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
2872;47;967;824;1366.771;586.2881;1.695;True;False
Node;AmplifyShaderEditor.ColorNode;3;-783.1248,-251.6523;Float;False;InstancedProperty;_D;D;2;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-866.9393,-61.33999;Float;True;Property;_Pond_Plant_A;Pond_Plant_A;1;0;Create;True;0;0;False;0;be0f01aa44a82b64e9f697c98084969a;be0f01aa44a82b64e9f697c98084969a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-532.9045,-115.0325;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Boomerang/Pond_Plant;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;False;TransparentCutout;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;3;0
WireConnection;2;1;1;1
WireConnection;0;0;2;0
WireConnection;0;10;1;2
ASEEND*/
//CHKSM=51FEFFFCBD11F1685EB15751BD7FD3142D403B0C