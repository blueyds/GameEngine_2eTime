import MetalKit

class CustomMesh: Mesh {
	private var _vertexBuffer: MTLBuffer!
	private var _vertices: [Vertex] = []
	var vertexCount: Int!{
		_vertices.count
	}
	var instanceCount: Int = 1
	
	init(device: MTLDevice!) {
		createVertices()
		createBuffers(device: device)
	}
	func createVertices() {	}
	
	func addVertex(position: simd_float3,
				   color: simd_float4 = simd_float4(1,0,1,1),
				   textureCoordinates: simd_float2 = simd_float2(repeating: 0),
				   normal: simd_float3 = simd_float3(0,1,0)){
		_vertices.append(Vertex(position: position, color: color, textureCoordinate: textureCoordinates, normal: normal))
	}
	func createBuffers(device: MTLDevice){
		_vertexBuffer = device.makeBuffer(bytes: _vertices, length: Vertex.stride(_vertices.count) )
	}
	func setInstanceCount(_ count: Int) {
		instanceCount = count
	}
	func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder){
		renderCommandEncoder.setVertexBuffer(_vertexBuffer, offset: 0, index: 0)
//		renderCommandEncoder.drawPrimitives(type: .triangle,
//											vertexStart: 0,
//											vertexCount: vertexCount)
		renderCommandEncoder.drawPrimitives(type: .triangle,
											vertexStart: 0,
											vertexCount: vertexCount,
											instanceCount: instanceCount)
	}
	
}
