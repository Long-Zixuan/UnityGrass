Shader "Toon/Grass"
{
    Properties
    {
		[Header(Shading)]
        _TopColor("Top Color", Color) = (1,1,1,1)
		_BottomColor("Bottom Color", Color) = (1,1,1,1)
		_TranslucentGain("Translucent Gain", Range(0,1)) = 0.5

    	_BendRotationRandom("Bend Rotation Random", Range(0, 1)) = 0.2
    	
    	_BladeWidth("Blade Width", Float) = 0.05
		_BladeWidthRandom("Blade Width Random", Float) = 0.02
		_BladeHeight("Blade Height", Float) = 0.5
		_BladeHeightRandom("Blade Height Random", Float) = 0.3
    	
    	_TessellationUniform("Tessellation Uniform", Range(1, 64)) = 1
    	
    	_WindDistortionMap("Wind Distortion Map", 2D) = "white" {}
		_WindFrequency("Wind Frequency", Vector) = (0.05, 0.05, 0, 0)
    	
    	_WindStrength("Wind Strength", Float) = 1
    	
    	_PlayerPos("Player Position", Vector) = (0,0,0)
    	_PlayerRadius("Player Radius",Float) = 1
    }
    
    SubShader
    {
		Cull Off

        Pass
        {
			Tags
			{
				"RenderType" = "Opaque"
				"LightMode" = "ForwardBase"
			}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment grassColfrag
            #pragma geometry grassGeo
            #pragma hull hull
			#pragma domain domain
			#pragma target 4.6
            #pragma multi_compile_fwdbase
            #include "Grass.cginc"
            ENDCG
        }
		Pass
		{
			Tags
			{
				"LightMode" = "ShadowCaster"
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma geometry grassGeo
			#pragma fragment grassShadowfrag
			#pragma hull hull
			#pragma domain domain
			#pragma target 4.6
			#pragma multi_compile_shadowcaster
			#include "Grass.cginc"
			ENDCG
		}
    }
}