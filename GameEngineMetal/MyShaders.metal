//
//  MyShaders.metal
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex_function(){
	return float4(1);
}

fragment half4 basic_fragment_shader(){
	return half4(1);
}

