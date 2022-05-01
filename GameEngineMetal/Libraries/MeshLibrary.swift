//
//  MeshLibrary.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit


protocol Mesh {
	var vertexBuffer: MTLBuffer! {get}
	var vertexCount: Int! {get}
	func setInstanceCount(_ count: Int)
	func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class MeshLibrary {
	enum Types {
		case Triangle_Custom
		case Quad_Custom
		case Cube_Custom
	}
	private var _meshes: [Types:Mesh] = [:]
	private var _device: MTLDevice!
	
	init(device: MTLDevice!){
		self._device = device
		createDefaultMeshes()
	}
	private func createDefaultMeshes(){
		_meshes.updateValue(Triangle_CustomMesh(device: _device), forKey: .Triangle_Custom)
		_meshes.updateValue(Quad_CustomMesh(device: _device), forKey: .Quad_Custom)
		_meshes.updateValue(Cube_CustomMesh(device: _device), forKey: .Cube_Custom)
		
	}
	public func mesh(_ meshType: Types)->Mesh{
		_meshes[meshType]!
	}
}

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

class Triangle_CustomMesh: CustomMesh {
	override func createVertices() {
		vertices = [
			Vertex(position: simd_float3(0,1,0), color: simd_float4(1,0,0,1)),
			Vertex(position: simd_float3(-1,-1,0), color: simd_float4(0,1,0,1)),
			Vertex(position: simd_float3(1,-1,0), color: simd_float4(0,0,1,1))
		]
	}
}
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
