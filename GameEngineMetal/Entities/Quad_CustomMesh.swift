import MetalKit

class Quad_CustomMesh: CustomMesh {
	override func createVertices() {
		vertices = [
			Vertex(position: simd_float3(1,1,0), color: simd_float4(1,0,0,1)), // TR
			Vertex(position: simd_float3(-1,1,0), color: simd_float4(0,1,0,1)), //TL
			Vertex(position: simd_float3(-1,-1,0), color: simd_float4(0,0,1,1)), //BL
			
			Vertex(position: simd_float3(1,1,0), color: simd_float4(1,0,0,1)), //TR
			Vertex(position: simd_float3(-1,-1,0), color: simd_float4(0,1,0,1)), //TL
			Vertex(position: simd_float3(1,-1,0), color: simd_float4(0,0,1,1)) //BR
		]
	}
}