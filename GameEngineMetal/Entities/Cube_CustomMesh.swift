import MetalKit

class Cube_CustomMesh: CustomMesh {
	override func createVertices() {
		vertices = [
			//Left
			Vertex(position: simd_float3(-1.0,-1.0,-1.0), color: simd_float4(1.0, 0.5, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0, 1.0), color: simd_float4(0.0, 1.0, 0.5, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0, 1.0), color: simd_float4(0.0, 0.5, 1.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0,-1.0), color: simd_float4(1.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0, 1.0), color: simd_float4(0.0, 1.0, 1.0, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0,-1.0), color: simd_float4(1.0, 0.0, 1.0, 1.0)),
			
			//RIGHT
			Vertex(position: simd_float3( 1.0, 1.0, 1.0), color: simd_float4(1.0, 0.0, 0.5, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0,-1.0), color: simd_float4(0.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3( 1.0, 1.0,-1.0), color: simd_float4(0.0, 0.5, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0,-1.0), color: simd_float4(1.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3( 1.0, 1.0, 1.0), color: simd_float4(0.0, 1.0, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0, 1.0), color: simd_float4(1.0, 0.5, 1.0, 1.0)),
			
			//TOP
			Vertex(position: simd_float3( 1.0, 1.0, 1.0), color: simd_float4(1.0, 0.0, 0.0, 1.0)),
			Vertex(position: simd_float3( 1.0, 1.0,-1.0), color: simd_float4(0.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0,-1.0), color: simd_float4(0.0, 0.0, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0, 1.0, 1.0), color: simd_float4(1.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0,-1.0), color: simd_float4(0.5, 1.0, 1.0, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0, 1.0), color: simd_float4(1.0, 0.0, 1.0, 1.0)),
			
			//BOTTOM
			Vertex(position: simd_float3( 1.0,-1.0, 1.0), color: simd_float4(1.0, 0.5, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0,-1.0), color: simd_float4(0.5, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0,-1.0), color: simd_float4(0.0, 0.0, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0, 1.0), color: simd_float4(1.0, 1.0, 0.5, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0, 1.0), color: simd_float4(0.0, 1.0, 1.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0,-1.0), color: simd_float4(1.0, 0.5, 1.0, 1.0)),
			
			//BACK
			Vertex(position: simd_float3( 1.0, 1.0,-1.0), color: simd_float4(1.0, 0.5, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0,-1.0), color: simd_float4(0.5, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0,-1.0), color: simd_float4(0.0, 0.0, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0, 1.0,-1.0), color: simd_float4(1.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0,-1.0), color: simd_float4(0.0, 1.0, 1.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0,-1.0), color: simd_float4(1.0, 0.5, 1.0, 1.0)),
			
			//FRONT
			Vertex(position: simd_float3(-1.0, 1.0, 1.0), color: simd_float4(1.0, 0.5, 0.0, 1.0)),
			Vertex(position: simd_float3(-1.0,-1.0, 1.0), color: simd_float4(0.0, 1.0, 0.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0, 1.0), color: simd_float4(0.5, 0.0, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0, 1.0, 1.0), color: simd_float4(1.0, 1.0, 0.5, 1.0)),
			Vertex(position: simd_float3(-1.0, 1.0, 1.0), color: simd_float4(0.0, 1.0, 1.0, 1.0)),
			Vertex(position: simd_float3( 1.0,-1.0, 1.0), color: simd_float4(1.0, 0.0, 1.0, 1.0))
		]
	}

}