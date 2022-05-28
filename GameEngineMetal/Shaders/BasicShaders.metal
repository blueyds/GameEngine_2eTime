//
//  MyShaders.metal
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//
#include <metal_stdlib>
#include "Shared.metal"
//using namespace metal

vertex RasterizerData basic_vertex_shader(const  VertexIn vIn[[ stage_in ]],
										  constant SceneConstants &sceneConstants [[ buffer(1) ]],
										  constant ModelConstants &modelConstants [[ buffer(2) ]]){
	RasterizerData rd;
	rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
	rd.color = vIn.color;
	rd.textureCoordinates = vIn.textureCoordinates;
	rd.totalGameTime = sceneConstants.totalGameTime;
	return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]],
									 constant Material &material [[ buffer(1) ]],
									 constant int &lightCount [[ buffer(2) ]],
									 constant LightData *lightDatas [[ buffer(3) ]],
									 metal::sampler sampler2d  [[ sampler(0) ]],
									 metal::texture2d<float> texture [[ texture(0) ]] ){
	float4 color;
	float2 texCoord = rd.textureCoordinates;
	if (material.useTexture){
		color = texture.sample(sampler2d, texCoord);
	}
	else if (material.useMaterialColor) {
		color = material.color;
	} else {
		color = rd.color;
	}
//	Lightdata lightData = lightDatas[0];
	
	if(material.isLit){
		float3 totalAmbient = float3(0,0,0);
		for(int i=0; i < lightCount; i++){
			LightData lightData = lightDatas[i];
			
			// ambient lighting
			float3 ambientness = material.ambient * lightData.ambientIntensity;
			float3 ambientColor = ambientness * lightData.color;
			totalAmbient += ambientColor;
		}
		float3 phongIntensity = totalAmbient;
		color *= float4(phongIntensity, 1.0);
	}
	
	return half4(color.r, color.g, color.b, color.a);
}

