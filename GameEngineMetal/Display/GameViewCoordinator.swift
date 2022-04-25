//
//  GameViewCoordinator.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit

class GameViewCoordinator: NSObject, MTKViewDelegate {
	
	var parent: MetalView
	
	let engine: Engine
	let preferences: Preferences
	

	//var clearColor: MTLClearColor
	
	var vertices: [Vertex]!
	
	var vertexBuffer: MTLBuffer!
	
	init (_ parent: MetalView){
		
		self.parent = parent
		
		preferences = Preferences.shared
		
		engine = Engine.shared
		
		super.init()
				
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
		vertexBuffer = engine.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count) )
	}
	
	
	func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
		
	}
		
	func draw(in view: MTKView) {
		guard let drawable = view.currentDrawable else { return}
		let commandBuffer = engine.commandQueue.makeCommandBuffer()
		//let renderPassDescriptor = view.currentRenderPassDescriptor
		if let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: view.currentRenderPassDescriptor)
		{
			renderCommandEncoder.setRenderPipelineState(engine.RenderState(.Basic))
			
			// send info to rendering commander
			renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
			renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
			
			renderCommandEncoder.endEncoding()
		}
		
		commandBuffer?.present(drawable)
		commandBuffer?.commit()
	}
}
