// Upgrade NOTE: upgraded instancing buffer 'BoomerangWater' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Boomerang/Water"
{
	Properties
	{
		_D("D", Color) = (0.7647059,0.208045,0.208045,0)
		_N("N", 2D) = "bump" {}
		_Roughness("Roughness", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _N;

		UNITY_INSTANCING_BUFFER_START(BoomerangWater)
			UNITY_DEFINE_INSTANCED_PROP(float4, _D)
#define _D_arr BoomerangWater
			UNITY_DEFINE_INSTANCED_PROP(float, _Roughness)
#define _Roughness_arr BoomerangWater
		UNITY_INSTANCING_BUFFER_END(BoomerangWater)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord5 = i.uv_texcoord * float2( 50,50 );
			float2 panner6 = ( 1.0 * _Time.y * float2( 0.08,0.07 ) + uv_TexCoord5);
			float2 uv_TexCoord7 = i.uv_texcoord * float2( 60,60 );
			float2 panner8 = ( 1.0 * _Time.y * float2( -0.08,0.06 ) + uv_TexCoord7);
			o.Normal = BlendNormals( UnpackNormal( tex2D( _N, panner6 ) ) , UnpackNormal( tex2D( _N, panner8 ) ) );
			float4 _D_Instance = UNITY_ACCESS_INSTANCED_PROP(_D_arr, _D);
			o.Albedo = _D_Instance.rgb;
			float _Roughness_Instance = UNITY_ACCESS_INSTANCED_PROP(_Roughness_arr, _Roughness);
			o.Smoothness = _Roughness_Instance;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
2874;52;967;824;1714.603;1371.626;2.310001;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-986.5854,-425.1991;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;50,50;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-984.0441,-69.20925;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;60,60;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;6;-754.1475,-425.1992;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.08,0.07;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;3;-799.9954,-285.5788;Float;True;Property;_N;N;1;0;Create;True;0;0;False;0;8803437774e58294f889e78723158013;8803437774e58294f889e78723158013;True;bump;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PannerNode;8;-751.6051,-69.2094;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.08,0.06;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;4;-556.6368,-188.8588;Float;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;False;0;8803437774e58294f889e78723158013;8803437774e58294f889e78723158013;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-554.5349,-389.3354;Float;True;Property;_SmallWaves;SmallWaves;0;0;Create;True;0;0;False;0;8803437774e58294f889e78723158013;8803437774e58294f889e78723158013;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;10;-73.1993,-75.92567;Float;False;InstancedProperty;_Roughness;Roughness;2;0;Create;True;0;0;False;0;0;0.98;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;2;-214.9946,-254.3788;Float;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;9;-221.0888,-584.5162;Float;False;InstancedProperty;_D;D;0;0;Create;True;0;0;False;0;0.7647059,0.208045,0.208045,0;0.7647059,0.208045,0.208045,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;253,-278;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Boomerang/Water;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;0
WireConnection;8;0;7;0
WireConnection;4;0;3;0
WireConnection;4;1;8;0
WireConnection;1;0;3;0
WireConnection;1;1;6;0
WireConnection;2;0;1;0
WireConnection;2;1;4;0
WireConnection;0;0;9;0
WireConnection;0;1;2;0
WireConnection;0;4;10;0
ASEEND*/
//CHKSM=3538DBB164979D8BBAA106DE1ED5AA43DB8C193F