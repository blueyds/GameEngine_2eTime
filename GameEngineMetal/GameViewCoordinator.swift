//
//  GameViewCoordinator.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit

class GameViewCoordinator: NSObject, MTKViewDelegate {
	
	var parent: MetalView
	var device: MTLDevice!
	var commandQueue: MTLCommandQueue!
	var renderPipelineState: MTLRenderPipelineState!
	//var clearColor: MTLClearColor
	var colorPixelFormat: MTLPixelFormat
	
	let vertices: [simd_float3] = [
		simd_float3(0.0, 1.0, 0.0), // TOP LEFT Vertex
		simd_float3(-1.0, -1.0, 0.0), // BOTTOM LEFT Vertex
		simd_float3(1.0, -1.0, 0.0) // BOTTOM RIGHT Vertex
	]
	var vertexBuffer: MTLBuffer!
	
	init (_ parent: MetalView){
		
		self.parent = parent
		
		if let metalDevice = MTLCreateSystemDefaultDevice(){
			self.device = metalDevice
		}
		
		//self.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1.0)
		
		self.colorPixelFormat = .bgra8Unorm
		
		self.commandQueue = device.makeCommandQueue()!
		
		super.init()
		
		createRenderPipelineState()
		
		createBuffers()
	}
	
	func createBuffers(){
		vertexBuffer = device.makeBuffer(bytes: vertices, length: MemoryLayout<simd_float3>.stride * vertices.count)
	}
	
	func createRenderPipelineState(){
		let library = device.makeDefaultLibrary()
		let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
		let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
		
		let renderPipeLineDescriptor = MTLRenderPipelineDescriptor()
		renderPipeLineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
		
		renderPipeLineDescriptor.vertexFunction = vertexFunction
		renderPipeLineDescriptor.fragmentFunction = fragmentFunction
		do{
			renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipeLineDescriptor)
		}catch let error as NSError {
			print(error)
		}
		
		
	}
	func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
		
	}
		
	func draw(in view: MTKView) {
		guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return}
		let commandBuffer = commandQueue.makeCommandBuffer()
		let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
		renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
		
		// send info to rendering commander
		renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
		renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
		
		renderCommandEncoder?.endEncoding()
		commandBuffer?.present(drawable)
		commandBuffer?.commit()
	}
}
