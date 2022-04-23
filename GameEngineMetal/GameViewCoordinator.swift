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
	
	var vertices: [Vertex]!
	
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
		vertexBuffer = device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count) )
	}
	
	func createRenderPipelineState(){
		let library = device.makeDefaultLibrary()
		let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
		let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
		
		let vertexDescriptor = MTLVertexDescriptor()
			
		// position
		vertexDescriptor.attributes[0].format = .float3
		vertexDescriptor.attributes[0].bufferIndex = 0
		vertexDescriptor.attributes[0].offset = 0
		
		// color
		vertexDescriptor.attributes[1].format = .float4
		vertexDescriptor.attributes[1].bufferIndex = 0
		vertexDescriptor.attributes[1].offset = simd_float3.size()
		
		vertexDescriptor.layouts[0].stride = Vertex.stride()
		
		let renderPipeLineDescriptor = MTLRenderPipelineDescriptor()
		renderPipeLineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
		renderPipeLineDescriptor.vertexFunction = vertexFunction
		renderPipeLineDescriptor.fragmentFunction = fragmentFunction
		renderPipeLineDescriptor.vertexDescriptor = vertexDescriptor
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
