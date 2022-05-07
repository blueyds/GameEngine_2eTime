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
									 constant Material &material [[ buffer(1) ]]){
	//float4 color = material.useMaterialColor ? material.color : rd.color;
	float2 texCoord = rd.textureCoordinates;
	float gameTime = rd.totalGameTime;
	float x = metal::sin((texCoord.x + gameTime) * 20);
	float y = metal::sin((texCoord.y - gameTime) * 20);
	float z = metal::tan((texCoord.x + gameTime) * 20);
	float4 color = float4(x,y,z, 1);
	return half4(color.r, color.g, color.b, color.a);
}

