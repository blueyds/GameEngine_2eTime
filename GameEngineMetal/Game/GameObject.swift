//
//  GameObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class GameObject {
	var vertices: [Vertex]!
	
	var vertexBuffer: MTLBuffer!
	
	init() {
		createVertices()
		createBuffers()
	}
	
	func createVertices() {
		vertices = [
			Vertex(position: simd_float3(0,1,0), color: simd_float4(1,0,0,1)),
			Vertex(position: simd_float3(-1,-1,0), color: simd_float4(0,1,0,1)),
			Vertex(position: simd_float3(1,-1,0), color: simd_float4(0,0,1,1))
		]
	}
	func createBuffers(){
		vertexBuffer = Engine.shared.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count) )
	}
	
	func render(renderCommandEncoder: MTLRenderCommandEncoder){
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Basic))
		// send info to rendering commander
		renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
		renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
	}
}
