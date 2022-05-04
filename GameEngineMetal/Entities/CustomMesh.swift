import MetalKit

class CustomMesh: Mesh {
	var vertexBuffer: MTLBuffer!
	var vertices: [Vertex] = []
	var vertexCount: Int!{
		vertices.count
	}
	var instanceCount: Int = 1
	
	init(device: MTLDevice!) {
		createVertices()
		createBuffers(device: device)
	}
	func createVertices() {	}
	func createBuffers(device: MTLDevice){
		vertexBuffer = device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count) )
	}
	func setInstanceCount(_ count: Int) {
		instanceCount = count
	}
	func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder){
		renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
//		renderCommandEncoder.drawPrimitives(type: .triangle,
//											vertexStart: 0,
//											vertexCount: vertexCount)
		renderCommandEncoder.drawPrimitives(type: .triangle,
											vertexStart: 0,
											vertexCount: vertexCount,
											instanceCount: instanceCount)
	}
	
}