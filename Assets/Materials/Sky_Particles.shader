// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Boomerang/Sky_Particles"
{
	Properties
	{
		_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 21
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_A("A", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _A;
		uniform float _Cutoff = 0.5;
		uniform float _TessValue;

		float4 tessFunction( )
		{
			return _TessValue;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float2 uv_TexCoord6 = v.texcoord.xy * float2( 5,5 );
			float2 panner7 = ( 1.0 * _Time.y * float2( 0.04,0.005 ) + uv_TexCoord6);
			float3 temp_cast_0 = (( tex2Dlod( _A, float4( panner7, 0, 0.0) ).g * 7.5 )).xxx;
			v.vertex.xyz += temp_cast_0;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _D = float4(0,0.5034485,1,0);
			o.Albedo = _D.rgb;
			o.Emission = ( _D * 1.0 ).rgb;
			o.Smoothness = 0.0;
			o.Alpha = 1;
			float2 uv_TexCoord5 = i.uv_texcoord * float2( 150,150 );
			clip( tex2D( _A, uv_TexCoord5 ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
2876;46;967;824;1730.985;351.6137;1.635;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-1188.482,541.8309;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;5,5;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;4;-1025.942,329.6392;Float;True;Property;_A;A;6;0;Create;True;0;0;False;0;ddb512d43a78722488076e017eb331ba;ddb512d43a78722488076e017eb331ba;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PannerNode;7;-951.8361,541.8309;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.04,0.005;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1025.975,190.2555;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;150,150;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-755.8229,436.7895;Float;True;Property;_TextureSample1;Texture Sample 1;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;10;-787.9556,56.0136;Float;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-606.326,641.9038;Float;False;Constant;_Float2;Float 2;2;0;Create;True;0;0;False;0;7.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-846.0076,-130.237;Float;False;Constant;_D;D;2;0;Create;True;0;0;False;0;0,0.5034485,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-753.9527,201.1695;Float;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-606.5425,-11.71378;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-343.8728,87.39753;Float;False;Constant;_Float1;Float 1;2;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-440.1369,563.2601;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;Boomerang/Sky_Particles;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;TransparentCutout;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;1;21;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;5;-1;-1;0;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;6;0
WireConnection;3;0;4;0
WireConnection;3;1;7;0
WireConnection;2;0;4;0
WireConnection;2;1;5;0
WireConnection;9;0;8;0
WireConnection;9;1;10;0
WireConnection;12;0;3;2
WireConnection;12;1;13;0
WireConnection;0;0;8;0
WireConnection;0;2;9;0
WireConnection;0;4;11;0
WireConnection;0;10;2;1
WireConnection;0;11;12;0
ASEEND*/
//CHKSM=B89C0C2035A16B944F0AAE74E9CC478022D750CE